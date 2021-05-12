  $(document).on('turbolinks:load', function() {
    return $('#patient_postal_code').jpostal({
      postcode: ['#patient_postal_code'],
      address: {
        '#patient_prefecture_code': '%3',
        '#patient_address_city': '%4',
        '#patient_address_street': '%5%6%7',
      },
    });
  });