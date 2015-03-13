namespace FlowersPlanet.Models.Domain
{
    public interface IMeta
    {
        string MetaDesc { get; set; }
        string MetaTitle { get; set; }
        string MetaKeys { get; set; }
        string Url { get; set; }
        string Article { get; set; }
    }
}