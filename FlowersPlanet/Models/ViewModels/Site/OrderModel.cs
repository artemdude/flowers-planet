namespace FlowersPlanet.Models.ViewModels
{
    public class OrderModel
    {
        public int Quantity { get; set; }

        //step 1
        public string SenderName { get; set; }
        public string SenderPhone { get; set; }
        public string SenderMail { get; set; }
        public string SenderAddress { get; set; }
        public string DeliveryDate { get; set; }
        public string SenderNotes { get; set; }

        //step 2
        public string RecipientName { get; set; }
        public string RecipientPhone { get; set; }
        public string RecipientAddress { get; set; }

        //step 3
        public bool Card { get; set;}
        public string CardFrom { get; set; }
        public string CardTo { get; set; }
        public string CardMessage { get; set; }
        public string CardNotes { get; set; }
    }
}