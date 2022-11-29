using Application.Interfaces;
using Domain.Dtos;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Threading.Tasks;
using WebApi.Dtos;

namespace WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EmailController: BaseController
    {
        private readonly IEmailSenderService emailSenderService;

        public EmailController(IEmailSenderService emailSenderService)
        {
            this.emailSenderService = emailSenderService;
        }

        [HttpPost("send")]
        public async Task<ActionResult<ResponseDto>> SendMail([FromBody] MailRequest request)
        {
            try
            {
                await emailSenderService.SendEmailAsync(request);
                return base.HandleResponse();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                throw;
            }
        }
    }
}
