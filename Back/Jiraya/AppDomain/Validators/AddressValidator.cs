using AppDomain.AppExceptions.Modules.UserModule;

namespace AppDomain.Validators
{
    public class AddressValidator
    {
        private readonly StreetNameContentValidator _streetNameContentValidator = new();
        private readonly NeighborhoodContentValidator _neighborhoodContentValidator = new();
        private readonly NumberContentValidator _numberContentValidator = new();
        private readonly CityContentValidator _cityContentValidator = new();
        private readonly StateContentValidator _stateContentValidator = new();
        private readonly ZipCodeContentValidator _zipCodeContentValidator = new();


        public void ValidateStreetName(string streetName) => _streetNameContentValidator.Validate(streetName);
        public void ValidateNeighborhood(string neighborhood) => _neighborhoodContentValidator.Validate(neighborhood);
        public void ValidateNumber(int number) => _numberContentValidator.Validate(number);
        public void ValidateCity(string city) => _cityContentValidator.Validate(city);
        public void ValidateState(string state) => _stateContentValidator.Validate(state);
        public void ValidateZipCode(string zipCode) => _zipCodeContentValidator.Validate(zipCode);

    }

    public class StreetNameContentValidator : BaseValidator
    {
        public override bool? Validate(string? streetName)
        {
            if (!string.IsNullOrEmpty(streetName) && streetName?.Length >= 5)
            {
                return NextValidator?.Validate(streetName) ?? true;
            }
            throw new AddressException(AddressExceptionMessage.EmptyStreetName);
        }
    }

    public class NeighborhoodContentValidator : BaseValidator
    {
        public override bool? Validate(string? neighborhood)
        {
            if (!string.IsNullOrEmpty(neighborhood))
            {
                return NextValidator?.Validate(neighborhood) ?? true;
            }
            throw new AddressException(AddressExceptionMessage.EmptyNeighborhood);
        }
    }
    public class NumberContentValidator : BaseValidator
    {
        public override bool? Validate(int? number)
        {
            if (number != null && number?.ToString().Length >= 1)
            {
                return NextValidator?.Validate(number) ?? true;
            }
            throw new AddressException(AddressExceptionMessage.EmptyNumber);
        }
    }

    public class CityContentValidator : BaseValidator
    {
        public override bool? Validate(string? city)
        {
            if (string.IsNullOrEmpty(city) && city?.Length >= 5)
            {
                return NextValidator?.Validate(city) ?? true;
            }
            throw new AddressException(AddressExceptionMessage.EmptyCity);
        }
    }
    public class StateContentValidator : BaseValidator
    {
        public override bool? Validate(string? state)
        {
            if (string.IsNullOrEmpty(state) && state?.Length >= 1)
            {
                return NextValidator?.Validate(state) ?? true;
            }
            throw new AddressException(AddressExceptionMessage.EmptyState);
        }
    }
    public class ZipCodeContentValidator : BaseValidator
    {
        public override bool? Validate(string? zipCode)
        {
            if (string.IsNullOrEmpty(zipCode) && zipCode?.Length >= 5)
            {
                return NextValidator?.Validate(zipCode) ?? true;
            }
            throw new AddressException(AddressExceptionMessage.EmptyZipCode);
        }
    }
}
