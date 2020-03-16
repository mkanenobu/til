
const validatePatterns = {
  yadocId: /^[a-z\d]{6,30}$/i,
  password: /^[A-Za-z\d~!@#$%^&*()-=_+[\]{}|;':",./<>?`]*$/,
  phoneNumber: /^0[6789]0[0-9]{8}$/,
  email: /^[\w+-.]+@[a-z\d-]+(\.[a-z\d-]+)*\.[a-z]+$/i,
};

const validate = Object.keys(validatePatterns).map((key) => {
  return {
    [key]: (value) =>
      validatePatterns[key].test(value),
  };
})

console.log(validate[0])
console.log(validate[0].yadocId('string'))

