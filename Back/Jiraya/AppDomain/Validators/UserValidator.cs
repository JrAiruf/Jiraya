using AppDomain.AppExceptions.Modules.UserModule;

namespace AppDomain.Validators
{
    internal class UserValidator
    {
        public UserValidator()
        {
            _codeContentValidator.NextValidator = _codeValidator;
            _phoneContentValidator.NextValidator = _phoneValidator;
        }

        private readonly PhoneContentValidator _phoneContentValidator = new();
        private readonly PhoneValidator _phoneValidator = new(11);
        private readonly CodeContentValidator _codeContentValidator = new();
        private readonly CodeValidator _codeValidator = new();

        public void ValidateCode(string code) => _codeContentValidator.Validate(code);
        public void ValidatePhone(string code) => _phoneContentValidator.Validate(code);
    }
    public class CodeContentValidator : BaseValidator
    {
        public override bool? Validate(string? input)
        {
            if (!string.IsNullOrEmpty(input))
            {
                return NextValidator.Validate(input) ?? true;
            }
            throw new UserException(UserExceptionMessage.EmptyCode);
        }
    }
    public class CodeValidator : BaseValidator
    {
        public override bool? Validate(string? input)
        {
            if (input?.ToString().Length >= 8)
            {
                return NextValidator?.Validate(input) ?? true;
            }
            throw new UserException(UserExceptionMessage.WrongCode);
        }
    }
    public class PhoneContentValidator : BaseValidator
    {
        public override bool? Validate(string? input)
        {
            if (!string.IsNullOrEmpty(input))
            {
                return NextValidator?.Validate(input) ?? true;
            }
            throw new UserException(UserExceptionMessage.EmptyPhone);
        }
    }
    public class PhoneValidator : BaseValidator
    {
        public PhoneValidator(int phoneNumberLength)
        {
            _phoneNumberLength = phoneNumberLength;
        }

        private readonly int _phoneNumberLength;
        public override bool? Validate(string? input)
        {
            if (input?.ToString().Length == _phoneNumberLength)
            {
                return NextValidator?.Validate(input) ?? true;
            }
            throw new UserException(UserExceptionMessage.WrongPhone);
        }
    }
}
