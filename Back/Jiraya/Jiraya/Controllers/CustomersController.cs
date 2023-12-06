using AppApplication.Modules.UserModule.Dtos;
using AppApplication.Modules.UserModule.Extensions;
using AppApplication.Modules.UserModule.Usecases;
using AppDomain.AppExceptions.Modules.UserModule;
using AppDomain.AppExceptions.Modules;
using AppDomain.AppExceptions;
using AppDomain.Modules.UserModule.Entities;
using Microsoft.AspNetCore.Mvc;

namespace Jiraya.API.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class CustomersController : ControllerBase
    {
        private readonly CreateCustomer _createCustomer;
        private readonly GetCustomer _getCustomer;
        private readonly GetCustomers _getCustomers;
        private readonly UpdateCustomer _updateCustomer;
        private readonly UpdateAddress _updateAddress;
        private readonly DeleteCustomer _deleteCustomer;
        public CustomersController(
             CreateCustomer createCustomer,
             GetCustomer getCustomer,
             GetCustomers getCustomers,
             UpdateCustomer updateCustomer,
             UpdateAddress updateAddress,
             DeleteCustomer deleteCustomer
             )
        {
            _createCustomer = createCustomer;
            _getCustomer = getCustomer;
            _getCustomers = getCustomers;
            _updateCustomer = updateCustomer;
            _updateAddress = updateAddress;
            _deleteCustomer = deleteCustomer;
        }

        [HttpPost]
        public async Task<ActionResult> CreateCustomerAsync([FromBody] CreateCustomerDto customer)
        {
            try
            {
                Address newAddress = new(
                    customer.Address.Neighborhood,
                    customer.Address.StreetAddress,
                    customer.Address.AddressNumber);

                Customer newCustomer = new(customer.Name, customer.Phone, newAddress);
                await _createCustomer.Handle(newCustomer);
                return StatusCode(201, newCustomer.AsDto());
            }
            catch (AppException exception)
            {
                if (exception is BaseException || exception is UserException || exception is AddressException)
                {
                    return BadRequest(exception.Message);
                }
                else
                {
                    return StatusCode(500, exception.Message);
                }
            }
        }


        [HttpGet]
        public async Task<ActionResult> GetCustomersAsync()
        {
            try
            {
                var customers = await _getCustomers.Handle();
                var customersDtoList = customers.Select(customer => customer.AsDto()).ToList();
                return Ok(customersDtoList);
            }
            catch (AppException exception)
            {
                return StatusCode(500, exception.Message);
            }
        }

        [HttpGet("{id}")]
        public async Task<ActionResult> GetCustomerAsync(Guid id)
        {
            try
            {
                var customer = await _getCustomer.Handle(id);
                if (customer != null)
                {
                    return Ok(customer.AsDto());
                }
                return NotFound("Cliente não encontrado");
            }
            catch (AppException exception)
            {
                return StatusCode(500, exception.Message);
            }
        }

        [HttpPut]
        public async Task<ActionResult> UpdateCustomerAsync([FromBody] UpdateCustomerDto customer)
        {
            try
            {
                Customer customerForUpdate = await _getCustomer.Handle(customer.Id);
                if (customerForUpdate != null)
                {
                    customerForUpdate.ChangeName(customer.Name);
                    customerForUpdate.ChangePhone(customer.Phone);
                    await _updateCustomer.Handle(customerForUpdate);
                    Customer updatedCustomer = await _getCustomer.Handle(customer.Id);
                    return Ok(updatedCustomer);
                }
                else
                {
                    return NotFound("Cliete não encontrado");
                }
            }
            catch (AppException exception)
            {
                if (exception is BaseException || exception is UserException)
                {
                    return BadRequest(exception.Message);
                }
                else
                {
                    return StatusCode(500, exception.Message);
                }
            }
        }

        [HttpPut]
        [Route("address")]
        public async Task<ActionResult> UpdateAddressAsync([FromBody] AddressDto address)
        {
            try
            {
                await _updateAddress.Handle(address.AsEntity());
                return Ok(address.Id);
            }
            catch (AppException exception)
            {
                if (exception is BaseException || exception is UserException)
                {
                    return BadRequest(exception.Message);
                }
                else
                {
                    return StatusCode(500, exception.Message);
                }
            }
        }

        [HttpDelete]
        public async Task<ActionResult> DeleteCustomerAsync(Guid id)
        {
            try
            {
                Customer currentCustomer = await _getCustomer.Handle(id);
                if (currentCustomer != null)
                {
                    await _deleteCustomer.Handle(id);
                    return Ok(id);
                }
                else
                {
                    return NotFound("Cliente não encontrado");
                }
            }
            catch (AppException exception)
            {
                return StatusCode(500, exception.Message);
            }
        }

    }
}
