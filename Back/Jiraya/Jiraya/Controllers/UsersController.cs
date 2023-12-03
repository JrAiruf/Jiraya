using AppApplication.Modules.UserModule.Dtos;
using AppApplication.Modules.UserModule.Extensions;
using AppApplication.Modules.UserModule.Usecases;
using AppDomain.AppExceptions;
using AppDomain.AppExceptions.Modules;
using AppDomain.AppExceptions.Modules.UserModule;
using AppDomain.Modules.UserModule.Entities;
using Microsoft.AspNetCore.Mvc;

namespace Jiraya.API.Controllers
{
    [ApiController]
    public class UsersController : ControllerBase
    {
        private readonly CreateUser _createUser;
        private readonly GetUser _getUser;
        private readonly GetUsers _getUsers;
        private readonly UpdateUser _updateUser;
        private readonly DeleteUser _deleteUser;

        public UsersController(
            CreateUser createUser,
            GetUser getUser,
            GetUsers getUsers,
            UpdateUser updateUser,
            DeleteUser deleteUser
            )
        {
            _createUser = createUser;
            _getUser = getUser;
            _getUsers = getUsers;
            _updateUser = updateUser;
            _deleteUser = deleteUser;
        }

        [HttpPost]
        [Route("api/[controller]/new-user")]
        public async Task<ActionResult> CreateUserAsync([FromBody] CreateUsersDto user)
        {
            try
            {
                User newUser = new(user.Name ?? "", user.Code ?? "");
                await _createUser.Handle(newUser);
                return StatusCode(201, newUser.AsDto());
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

        [HttpGet("{id}")]
        public async Task<ActionResult> GetUserAsync(Guid id)
        {
            try
            {
                var user = await _getUser.Handle(id);
                if (user != null)
                {
                    return Ok(user.AsDto());
                }
                return NotFound("Usuário não encontrado");
            }
            catch (AppException exception)
            {
                return StatusCode(500, exception.Message);
            }
        }

        [HttpGet]
        [Route("api/[controller]")]
        public async Task<ActionResult> GetUsersAsync()
        {
            try
            {
                var users = await _getUsers.Handle();
                var usersDtoList = users.Select(user => user.AsDto()).ToList();
                return Ok(usersDtoList);
            }
            catch (AppException exception)
            {
                return StatusCode(500, exception.Message);
            }
        }


        [HttpPut]
        [Route("api/[controller]")]
        public async Task<ActionResult> UpdateUserAsync([FromBody] UpdateUserDto user)
        {
            try
            {
                User userForUpdate = await _getUser.Handle(user.Id);
                if (userForUpdate != null)
                {
                    userForUpdate.ChangeName(user.Name);
                    userForUpdate.ChangeCode(user.Code);
                    await _updateUser.Handle(userForUpdate);
                    User updatedUser = await _getUser.Handle(user.Id);
                    return Ok(updatedUser.AsDto());
                }
                else
                {
                    return NotFound("Usuário não encontrado");
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

        [HttpDelete("{id}")]
        public async Task<ActionResult> DeleteUserAsync(Guid id)
        {
            try
            {
                User currentUser = await _getUser.Handle(id);
                if (currentUser != null)
                {
                await _deleteUser.Handle(id);
                return Ok(id);
                }
                else
                {
                    return NotFound("Usuário não encontrado");
                }
            }
            catch (Exception exception)
            {
                return StatusCode(500, exception.Message);
            }
        }
    }
}
