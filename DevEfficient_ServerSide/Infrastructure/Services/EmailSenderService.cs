using Application.Interfaces;
using Domain.Dtos;
using Infrastructure.Settings;
using MailKit.Net.Smtp;
using MailKit.Security;
using Microsoft.Extensions.Options;
using MimeKit;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Infrastructure.Services
{
    public class EmailSenderService : IEmailSenderService
    {
        private readonly MailSettings _mailSettings;
        public EmailSenderService(IOptions<MailSettings> mailSettings)
        {
            _mailSettings = mailSettings.Value;
        }
        public async Task SendEmailAsync(MailRequest mailRequest)
        {
            var email = new MimeMessage();
            email.Sender = MailboxAddress.Parse(_mailSettings.Mail);
            email.To.Add(MailboxAddress.Parse(mailRequest.ToEmail));
            email.Subject = "Team Request - DevEfficient";
            var builder = new BodyBuilder();
            builder.HtmlBody = "Do you want to be part of our team? Navigate to the following link for confirmation - http://localhost:4200/mailconfirmation";
            email.Body = builder.ToMessageBody();
            using var smtp = new SmtpClient();
            smtp.Connect(_mailSettings.Host, _mailSettings.Port, SecureSocketOptions.StartTls);
            smtp.Authenticate(_mailSettings.Mail, _mailSettings.Password);
            await smtp.SendAsync(email);
            smtp.Disconnect(true);
        }

        public void SendEmail(string fromEmail, string toEmail, string subject, string body, DateTime date, string signature, List<string> distributionList)
        {
            var email = new MimeMessage();
            email.Sender = MailboxAddress.Parse(fromEmail);
            email.To.Add(MailboxAddress.Parse(toEmail));
            email.Subject = subject;
            var builder = new BodyBuilder();
            builder.HtmlBody = body + date.ToString() + signature + distributionList;
            email.Body = builder.ToMessageBody();
        }
    }
}
