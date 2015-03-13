using System;
using System.Collections.Generic;
using System.Configuration;
using System.Net;
using System.Net.Mail;

namespace FlowersPlanet.Helpers
{
    public class Mail
    {
        public static void Send(string subject, string body, string sender, IEnumerable<string> recipients, Attachment attachment)
        {
            var message = new MailMessage();

            foreach (string recipient in recipients)
            {
                message.To.Add(recipient);
            }

            message.From = new MailAddress(sender);
            message.Subject = subject;
            message.IsBodyHtml = true;
            message.Body = body;

            if (attachment != null)
            {
                message.Attachments.Add(attachment);
            }


            // Create SMTP client and configure credentials if needed
            var client = new SmtpClient(ConfigurationManager.AppSettings["SMTPHost"]);

            if (!string.IsNullOrEmpty(ConfigurationManager.AppSettings["EnableSsl"]))
            {
                client.EnableSsl = bool.Parse(ConfigurationManager.AppSettings["EnableSsl"]);
            }

            if (!string.IsNullOrEmpty(ConfigurationManager.AppSettings["SMTPPort"]))
            {
                client.Port = int.Parse(ConfigurationManager.AppSettings["SMTPPort"]);
            }

            if (!string.IsNullOrEmpty(ConfigurationManager.AppSettings["SMTPUsername"]))
            {
                client.Credentials = new NetworkCredential(ConfigurationManager.AppSettings["SMTPUsername"], ConfigurationManager.AppSettings["SMTPPassword"]);
            }

            // Send a message
            client.Send(message);
        }

    }
}