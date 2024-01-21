using AppInfra.Contracts;
using AppInfra.Data;
using AppInfra.Repositories;
using AppInfra.Services;
using Jiraya.API;
using Microsoft.Extensions.FileProviders;

WebApplicationBuilder builder = WebApplication.CreateBuilder(args);
AppUsecaseContainer usecaseContainer = new(builder);

builder.Services.AddDbContext<ApplicationDbContext>();

//REPOSITORIES
builder.Services.AddScoped<IUserRepository, UserRepository>();
builder.Services.AddScoped<IProductRepository, ProductRepository>();
//SERVICES
//builder.Services.AddScoped<ITokenService, TokenService>();
//USECASES INITIALIZATION
usecaseContainer.InitUser();
usecaseContainer.InitProduct();
usecaseContainer.InitCustomer();
usecaseContainer.InitProductOrder();
usecaseContainer.InitProductImage();

builder.Services.AddAuthentication();
builder.Services.AddControllers();
builder.Services.AddCors();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

WebApplication app = builder.Build();

if (app.Environment.IsDevelopment())
{
    _ = app.UseSwagger();
    _ = app.UseSwaggerUI();
}

app.UseHttpsRedirection();
app.UseAuthentication();

app.UseCors(
options => options.
AllowAnyHeader().
AllowAnyMethod().
AllowAnyOrigin());

app.UseStaticFiles(new StaticFileOptions()
{
    FileProvider = new PhysicalFileProvider(Path.Combine(Directory.GetCurrentDirectory(), "Resources")),
    RequestPath = new PathString("/Resources")
});
app.MapControllers();

app.Run();
