<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<FlowersPlanet.Models.ViewModels.IMetaViewModel>" %>

      Статейка<br />
  <%= Html.TextAreaFor(m => Model.Object.Article, new { id="Body"})%>

<script src="<%= ResolveUrl("~/Scripts/RichTextEditors/CKeditor/ckeditor.js") %>"
    type="text/javascript"></script>

<script type="text/javascript">
                        //<![CDATA[
                        CKEDITOR.replace('Body',
                {
                    skin: 'kama',
                    language: 'ru'
                });
                        //]]>
</script>

    <div class="space10"></div>

<table class="body-table">
    <tr>
        <td width="200px">
            Url
        </td>
        <td>
            <%= Html.TextBoxFor(m => Model.Object.Url, new { @class = "singleTextBox required" })%>
            <br />
            <%= Html.ValidationMessageFor(m => Model.Object.Url)%>
        </td>
    </tr>
    <tr>
        <td>
            Тайтл
        </td>
        <td>
            <%= Html.TextBoxFor(m => Model.Object.MetaTitle, new { @class = "singleTextBox" })%>
            <br />
            <%= Html.ValidationMessageFor(m => Model.Object.MetaTitle)%>
        </td>
    </tr>
    <tr>
        <td>
            Ключевые слова
        </td>
        <td>
            <%= Html.TextAreaFor(m => Model.Object.MetaKeys, new { @class = "singleTextBox" })%>
            <br />
            <%= Html.ValidationMessageFor(m => Model.Object.MetaKeys)%>
        </td>
    </tr>
    <tr>
        <td>
            Описание
        </td>
        <td>
            <%= Html.TextAreaFor(m => Model.Object.MetaDesc, new { @class = "singleTextBox" })%>
            <br />
            <%= Html.ValidationMessageFor(m => Model.Object.MetaDesc)%>
        </td>
    </tr>
</table>
