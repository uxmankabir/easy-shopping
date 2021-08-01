import { getCookie, setCookie, deleteCookie } from './cookies'

document.addEventListener("turbolinks:load", function() {

  if(getCookie("cart") === ""){
    let data = []
    setCookie("cart", data)
  }

  updateCartCounter()
  addCartButtons()

  $(document).on("click", ".js-add-to-cart", function(){
    let product_id = $(this).data("product-id")
    if(!alreadyInCart(product_id)){
      addToCart(product_id)
      showRemoveFromCartButton($(this).parent(), product_id)
    }
  })

  $(document).on("click", ".js-remove-from-cart", function(){
    let product_id = $(this).data("product-id")
    if(alreadyInCart(product_id)){
      removeFromCart(product_id)
      showAddToCartButton($(this).parent(), product_id)
    }
  })

  $(".js-nav-cart-btn").on("click", function(){
    let cart = getCookie("cart")
    $.ajax({
      type: "get",
      url: "/products/cart",
      data: { product_ids: cart }
    })
  })

  $(document).on("click", ".js-checkout", function(){
    let buyer_signed_in = $(this).data("buyer-signed-in")
    if(buyer_signed_in === true){
      let data = []
      setCookie("cart", data)
    }
  })

})

function addToCart(product_id){
  let cart = getCookie("cart")
  cart.push(product_id)
  setCookie("cart", cart)
  updateCartCounter()
}

function removeFromCart(product_id){
  let cart = getCookie("cart")
  var index = cart.indexOf(product_id);
  if (index !== -1) {
    cart.splice(index, 1);
    setCookie("cart", cart)
    updateCartCounter()
  }
}


function alreadyInCart(product_id){
  let cart = getCookie("cart")
  return cart.includes(product_id)
}

function updateCartCounter(){
  let cart = getCookie("cart")
  $(".js-cart-counter").text(cart.length)
}

function addCartButtons(){
  let product_id = ""
  $(".js-cart-btn").each(function(){
    product_id = $(this).data("product-id")
    if(alreadyInCart(product_id)){
      showRemoveFromCartButton($(this), product_id)
    }
    else{
      showAddToCartButton($(this), product_id)
    }
  })
}

function addToCartButton(product_id){
  return `<button name="button" type="button" class="btn btn-primary d-flex align-items-center mx-auto js-product-cart-btn js-add-to-cart" data-product-id="${product_id}">Add to Cart
            <span class="material-icons-round ms-3">add_shopping_cart</span>
          </button>`
}


function removeFromCartButton(product_id){
  return `<button name="button" type="button" class="btn btn-danger d-flex align-items-center mx-auto js-product-cart-btn js-remove-from-cart" data-product-id="${product_id}">Remove from Cart
            <span class="material-icons-round ms-3">remove_shopping_cart</span>
          </button>`
}

function showAddToCartButton(button_container, product_id){
  button_container.html(addToCartButton(product_id))
}

function showRemoveFromCartButton(button_container, product_id){
  button_container.html(removeFromCartButton(product_id))
}