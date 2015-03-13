<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<FlowersPlanet.Models.ViewModels.OrderViewModel>" %>

<%@ Import Namespace="FlowersPlanet.Helpers.Html" %>
<%@ Import Namespace="FlowersPlanet.Constants" %>
<asp:Content ID="Title" ContentPlaceHolderID="Title" runat="server">
    Форма заказа
</asp:Content>
<asp:Content ID="MetaTagsContent" ContentPlaceHolderID="MetaTagsContent" runat="server">
    <meta name="robots" content="noindex, nofollow">
</asp:Content>
<asp:Content ID="MainMenu" ContentPlaceHolderID="MainMenu" runat="server">
</asp:Content>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

    <script language="javascript" type="text/javascript">

        $(document).ready(function() {

            $('#cardCheckBox').change(function() {

                if ($(this).is(':checked')) {
                    $('#step3 input[type=text], textarea').removeAttr('disabled');
                }
                else {
                    $('#step3 input[type=text], textarea').attr('disabled', 'disabled');

                }

            });


            //Watermarks
            $('#SenderName').watermark('Ваше имя (по желанию)', { className: 'watermark' });
            $('#SenderPhone').watermark('Ваш телефон', { className: 'watermark' });
            $('#SenderMail').watermark('Ваш эмейл (по желанию)', { className: 'watermark' });
            $('#SenderAddress').watermark('Ваш адрес', { className: 'watermark' });
            $('#DeliveryDate').watermark('Дата и время доставки', { className: 'watermark' });
            $('#SenderNotes').watermark('Примечания (по желанию)', { className: 'watermark' });

            $('#RecipientName').watermark('Имя получателя', { className: 'watermark' });
            $('#RecipientPhone').watermark('Телефон получателя', { className: 'watermark' });
            $('#RecipientAddress').watermark('Адрес получателя', { className: 'watermark' });

            $('#CardTo').watermark('Кому (по желанию)', { className: 'watermark' });
            $('#CardFrom').watermark('От кого (по желанию)', { className: 'watermark' });
            $('#CardMessage').watermark('Сообщение (по желанию)', { className: 'watermark' });
            $('#CardNotes').watermark('Примечание (по желанию)', { className: 'watermark' });

            if ($('#step1').length == 0) {
                ToStep4();
            }

            $("#quantityFake").jStepper({ minValue: 1, maxValue: 1000 });

            var price = $('#price').text();

            $('#quantityFake').keyup(function() {
                $('#quantity').val($(this).val());


                $('#finalPrice').text((price * $(this).val()) + parseInt($('#delivery').text()));
                //console.log((price * $(this).val()) + parseInt($('#delivery').text()));
            });

        });

        function ToStep1() {
            $('.orderStep').removeClass('selectedOrderStep');
            $('.orderStep1').addClass('selectedOrderStep');

            $('#step2').hide();
            $('#step1').show();
        }

        function Step1Validation() {
            var isValid = true;

            if ($('#SenderPhone').val() == 'Ваш телефон' || $('#SenderPhone').val() == '') {
                $('#SenderPhoneValid').show();
                isValid = false;
            }
            else {
                $('#SenderPhoneValid').hide();
            }

            if ($('#SenderMail').val() != 'Ваш эмейл (по желанию)' && $('#SenderMail').val() != '') {

                if ($('#SenderMail').val().match(/\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/)) {
                    $('#SenderMailValid').hide();
                }
                else {
                    $('#SenderMailValid').show();
                    isValid = false;
                }

            }
            else {
                $('#SenderMailValid').hide();
            }


            if ($('#SenderAddress').val() == 'Ваш адрес' || $('#SenderAddress').val() == '') {
                $('#SenderAddressValid').show();
                isValid = false;
            }
            else {
                $('#SenderAddressValid').hide();
            }

            if ($('#DeliveryDate').val() == 'Дата и время доставки' || $('#SenderPhone').val() == '') {
                $('#DeliveryDateValid').show();
                isValid = false;
            }
            else {
                $('#DeliveryDateValid').hide();
            }

            if (isValid == false) {
                return false;
            }
            //            if ($('#SenderPhone').val() == 'Ваш телефон' || $('#SenderPhone').val() == '' || $('#DeliveryDate').val() == 'Дата и время доставки' || $('#SenderPhone').val() == '' || $('#DeliveryDate').val() == 'Дата и время доставки' || $('#SenderPhone').val() == '') {
            //                return false;
            //            }
        }

        function Step2Validation() {
            var isValid = true;

            if ($('#RecipientName').val() == 'Имя получателя' || $('#RecipientName').val() == '') {
                $('#RecipientNameValid').show();
                isValid = false;
            }
            else {
                $('#RecipientNameValid').hide();
            }

            if ($('#RecipientPhone').val() == 'Телефон получателя' || $('#RecipientPhone').val() == '') {
                $('#RecipientPhoneValid').show();
                isValid = false;
            }
            else {
                $('#RecipientPhoneValid').hide();
            }

            if ($('#RecipientAddress').val() == 'Адрес получателя' || $('#RecipientAddress').val() == '') {
                $('#RecipientAddressValid').show();
                isValid = false;
            }
            else {
                $('#RecipientAddressValid').hide();
            }

            if (isValid == false) {
                return false;
            }
            //            if ($('#RecipientName').val() == 'Имя получателя' || $('#RecipientName').val() == '' || $('#RecipientPhone').val() == 'Телефон получателя' || $('#RecipientPhone').val() == '' || $('#RecipientAddress').val() == 'Адрес получателя' || $('#RecipientAddress').val() == '') {
            //                return false;
            //            }
        }

        function ToStep2() {

            if ($('#step1').is(':visible')) {

                if (Step1Validation() == false) {
                    return false;
                }
            }

            $('.orderStep').removeClass('selectedOrderStep');
            $('.orderStep2').addClass('selectedOrderStep');

            $('#step1').hide();
            $('#step3').hide();
            $('#step2').show();
        }

        function ToStep3() {

            if (Step2Validation() == false) {
                return false;
            }

            $('.orderStep').removeClass('selectedOrderStep');
            $('.orderStep3').addClass('selectedOrderStep');

            $('#step2').hide();
            $('#step3').show();
        }

        function ToStep4() {
            $('.orderStep').removeClass('selectedOrderStep');
            $('.orderStep4').addClass('selectedOrderStep');

            $('#orderDescription').hide();
            $('#step3').hide();
            $('#step4').show();
        }
    
    </script>

    <div style="height: 25px;">
    </div>
    <table width="100%">
        <tr>
            <td style="border-right: solid 1px #fff" class="orderStep selectedOrderStep orderStep1">
                Шаг 1 - Ваша информация
            </td>
            <td style="width: 244px; border-right: solid 1px #fff" class="orderStep orderStep2">
                Шаг 2 - Информация получателя
            </td>
            <td style="border-right: solid 1px #fff" class="orderStep orderStep3">
                Шаг 3 - Информация об открытке
            </td>
            <td class="orderStep orderStep4">
                Шаг 4 оплата услуг
            </td>
        </tr>
    </table>
    <div id="orderContainer">
        <% if (Model != null)
           { %>
        <% using (Html.BeginForm())
           {%>
        <div class="orderContainer">
            <h1>
                Оформление заказа</h1>
            <div id="step1">
                <div class="orderStepContainer">
                    <b>Шаг 1 - Ваша информация</b>
                    <div class="spaceX">
                    </div>
                    <%= Html.TextBoxFor(m => Model.Order.SenderName, new { @class = "textbox", id = "SenderName" })%>
                    <div class="spaceX">
                    </div>
                    <%= Html.TextBoxFor(m => Model.Order.SenderPhone, new { @class = "textbox", id = "SenderPhone" })%>
                    <div id="SenderPhoneValid" class="validationLabel">
                        Необходимо ввести номер телефона</div>
                    <div class="spaceX">
                    </div>
                    <%= Html.TextBoxFor(m => Model.Order.SenderMail, new { @class = "textbox", id = "SenderMail" })%>
                    <div id="SenderMailValid" class="validationLabel">
                        Необходимо ввести корректный эмейл</div>
                    <div class="spaceX">
                    </div>
                    <%= Html.TextBoxFor(m => Model.Order.SenderAddress, new { @class = "textbox", id = "SenderAddress" })%>
                    <div id="SenderAddressValid" class="validationLabel">
                        Необходимо ввести адрес</div>
                    <div class="spaceX">
                    </div>
                    <%= Html.TextBoxFor(m => Model.Order.DeliveryDate, new { @class = "textbox", id = "DeliveryDate" })%>
                    <div id="DeliveryDateValid" class="validationLabel">
                        Необходимо ввести время доставки</div>
                    <div class="spaceX">
                    </div>
                    <%= Html.TextAreaFor(m => Model.Order.SenderNotes, new { @class = "textbox", id = "SenderNotes" })%>
                    <div class="spaceX">
                    </div>
                    <input onclick="_gaq.push(['_trackPageview', '/order/step2.html']); ToStep2()" type="button"
                        class="nextButton" style="float: right;" value="Дальше" />
                </div>
            </div>
            <div id="step2" style="display: none;">
                <div class="orderStepContainer">
                    <b>Шаг 2 - Информация получателя</b>
                    <div class="spaceX">
                    </div>
                    <%= Html.TextBoxFor(m => Model.Order.RecipientName, new { @class = "textbox", id = "RecipientName" })%>
                    <div id="RecipientNameValid" class="validationLabel">
                        Необходимо ввести имя получателя</div>
                    <div class="spaceX">
                    </div>
                    <%= Html.TextBoxFor(m => Model.Order.RecipientPhone, new { @class = "textbox", id = "RecipientPhone" })%>
                    <div id="RecipientPhoneValid" class="validationLabel">
                        Необходимо ввести телефон получателя</div>
                    <div class="spaceX">
                    </div>
                    <%= Html.TextBoxFor(m => Model.Order.RecipientAddress, new { @class = "textbox", id = "RecipientAddress" })%>
                    <div id="RecipientAddressValid" class="validationLabel">
                        Необходимо ввести адрес получателя</div>
                    <div class="spaceX">
                    </div>
                    <input onclick="ToStep1()" type="button" class="backButton fLeft" value="Назад" />
                    <input onclick="_gaq.push(['_trackPageview', '/order/step3.html']); ToStep3()" type="button"
                        class="nextButton fRight" value="Дальше" />
                </div>
            </div>
            <div id="step3" style="display: none;">
                <div class="orderStepContainer">
                    <b>Шаг 3 - Информация об открытке</b>
                    <div class="spaceX">
                    </div>
                    <%= Html.CheckBoxFor(m => m.Order.Card, new { id = "cardCheckBox"}) %>
                    С открыткой
                    <div class="space10">
                    </div>
                    <%= Html.TextBoxFor(m => Model.Order.CardTo, new { @class = "textbox", id = "CardTo" })%>
                    <div class="spaceX">
                    </div>
                    <%= Html.TextBoxFor(m => Model.Order.CardFrom, new { @class = "textbox", id = "CardFrom" })%>
                    <div class="spaceX">
                    </div>
                    <%= Html.TextAreaFor(m => Model.Order.CardMessage, new { @class = "textbox", id = "CardMessage" })%>
                    <div class="spaceX">
                    </div>
                    <%= Html.TextAreaFor(m => Model.Order.CardNotes, new { @class = "textbox", id = "CardNotes" })%>
                    <div class="spaceX">
                    </div>
                    <input onclick="ToStep2()" type="button" class="backButton fLeft" value="Назад" />
                    <input type="submit" class="nextButton fRight" name="btnSubmit" onclick="_gaq.push(['_trackPageview', '/order/step4.html']);"
                        value="Дальше" />
                </div>
            </div>
            <%= Html.TextBoxFor(m => Model.Order.Quantity, new { @class = "textbox hide", id = "quantity" })%>
        </div>
        <% } %>
        <div style="float: left; width: 10px; margin-top: 20px;">
            <img src="../../Images/Site/vline.png" />
        </div>
        <div id="orderDescription">
            <% if (Model != null)
               { %>
            <h1>
                Информация о товаре</h1>
            <a href="<%= Html.RouteUrl("Flower") %>">
                <img width="110px" height="" src="/Photo/Small/<%= Model.Flower.Id %>" /></a>
            <div class="space15">
            </div>
            <table id="orderDescTable" width="100%">
                <tr>
                    <td>
                        Вы заказали товар:
                    </td>
                    <td width="20px">
                    </td>
                    <td>
                        <a href="<%= Html.RouteUrl("Flower") %>">
                            <%=  Html.DisplayTextFor(m => Model.Flower.Name)%></a> код
                        <%=  Html.DisplayTextFor(m => Model.Flower.Id)%>
                    </td>
                </tr>
                <tr>
                    <td>
                        Стоимость товара:
                    </td>
                    <td>
                    </td>
                    <td>
                        <b><span id="price">
                            <%=  Html.DisplayTextFor(m => Model.Flower.Price) %>
                        </span>
                            <%= Currency.Grivna %>
                        </b>
                    </td>
                </tr>
                <tr>
                    <td>
                        Количество:
                    </td>
                    <td>
                    </td>
                    <td>
                        <input id="quantityFake" style="width: 100px" class="textbox" value="1" type="text" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Доставка:
                    </td>
                    <td>
                    </td>
                    <td>
                        <b><span id="delivery">
                            <%= Delivery.Courier %></span>
                            <%= Currency.Grivna %></b> <a href="<%= Html.RouteUrl("DeliveryAndPayment") %>">Подробнее</a>
                    </td>
                </tr>
                <tr style="font-size: 20px;">
                    <td>
                        Итого
                    </td>
                    <td>
                    </td>
                    <td>
                        <span id="finalPrice">
                            <%= Model.Flower.Price + Delivery.Courier %></span>
                        <%= Currency.Grivna %>
                    </td>
                </tr>
            </table>
            <br />
            <% } %>
        </div>
        <% } %>
        <div class="orderContainer">
            <div id="step4" style="display: none;">
                <h1>
                    Спасибо, Ваш заказ отправлен</h1>
                <div class="orderStepContainer textLineHeight">
                    Наши менеджеры обрабатывают заказ и свяжутся с Вами максимально быстро.
                    <br />
                    В данное время мы принимаем только наличный расчет. Оплата на месте курьеру<br />
                    <br />
                    <a href="<%= Html.RouteUrl("Index") %>">На главную</a>
                </div>
            </div>
        </div>
    </div>
    <div id="orderFooter">
        Есть вопросы? Звоните 537-18-35
    </div>
</asp:Content>
