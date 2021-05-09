  $(function() {
    return $('#patient_postcode').jpostal({
      postcode: ['#patient_postcode'],
      address: {
        '#patient_prefecture_code': '%3',
        '#patient_address_city': '%4',
        '#patient_address_street': '%5%6%7',
      },
    });
  });