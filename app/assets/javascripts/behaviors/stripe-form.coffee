##
# [data-stripe-form]
# Credit-card fomatting and validation
#

onSubmit = (e) ->
  $form = $(e.target)
  $('[data-stripe="submit"]').button('loading')
  Stripe.card.createToken($form, onStripeResponse)
  e.preventDefault()

onStripeResponse = (status, response) ->
  $form = $('[data-stripe="form"]')

  if response.error
    $('[data-stripe="feedback"]')
      .text(response.error.message)
      .removeClass('hidden')
    $('[data-stripe="submit"]').button('reset')
  else
    $('[data-stripe="form"]').off('submit')
    $form.find('input[name="token"]').val(response.id)
    $form.submit()

onValid = ($input) ->
  $input.parents('.form-group')
    .removeClass('has-feedback has-error')
    .addClass('has-feedback has-success')
  $input.parents('.form-group')
    .find('.form-control-feedback-success').removeClass('hidden').end()
    .find('.form-control-feedback-error').addClass('hidden')

onInvalid = ($input) ->
  $input.parents('.form-group')
    .removeClass('has-feedback has-success')
    .addClass('has-feedback has-error')
  $input.parents('.form-group')
    .find('.form-control-feedback-error').removeClass('hidden').end()
    .find('.form-control-feedback-success').addClass('hidden')

onChange = (e) ->
  $input = $(e.target)
  valid = switch $input.data('stripe')
    when 'number' then $.payment.validateCardNumber($input.val())
    when 'exp'
      { month, year } = $.payment.cardExpiryVal($input.val())
      # hack to fix 1password autocomplete
      unless year
        year = parseInt(month.toString().substring(1, 3))
        month = parseInt(month.toString().substring(0, 1))
      $.payment.validateCardExpiry(month, year)
    when 'cvc' then $.payment.validateCardCVC($input.val())
    when 'coupon' then $input.val().length > 3
  if valid then onValid($input) else onInvalid($input)

$(document).on 'ready', ->
  $('[data-stripe="number"]').payment('formatCardNumber').on('input blur', onChange)
  $('[data-stripe="exp"]').payment('formatCardExpiry').on('input blur', onChange)
  $('[data-stripe="cvc"]').payment('formatCardCVC').on('input blur', onChange)
  $('[data-stripe="coupon"]').on('input blur', onChange)
  $('[data-stripe="form"]').on('submit', onSubmit)
