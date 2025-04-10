codeunit 50028 "SMS Integration Management"
{
    trigger OnRun()
    begin
        ClearSMSBuffer()
    end;

    procedure SendSMS(ToContactNo: Text[30]; MessageTxt: Text): Boolean
    var
        Client: HttpClient;
        RequestMessage: HttpRequestMessage;
        Content: HttpContent;
        RequestHeader, ContentHeaders : HttpHeaders;
        IsSuccessful: Boolean;
        Response: HttpResponseMessage;
        ResponseText: Text;
        DataPoint: JsonObject;

    begin

        SMSSetup.Get();
        // DataPoint.Add('apikey', SMSSetup.ApiKey);
        // DataPoint.Add('partnerID', SMSSetup."Partner ID");
        // DataPoint.Add('shortcode', SMSSetup.Shortcode);
        // DataPoint.Add('mobile', ToContactNo);
        // DataPoint.Add('message', MessageTxt);
        //DataPoint.Add('Authorization', SMSSetup.ApiKey);
        // DataPoint.Add('partnerID', SMSSetup."Partner ID");
        //  DataPoint.Add('shortcode', SMSSetup.Shortcode);
        DataPoint.Add('phone', ToContactNo);
        DataPoint.Add('message', MessageTxt);

        Content.WriteFrom(Format(DataPoint));

        Content.GetHeaders(ContentHeaders);
        ContentHeaders.Remove('Content-Type');
        ContentHeaders.Add('Content-Type', 'application/json');
        RequestMessage.GetHeaders(RequestHeader);
        RequestHeader.Remove('Accept');
        RequestHeader.Add('Accept', 'application/json');
        // RequestHeader.Add('Authorization', SMSSetup.ApiKey);

        RequestMessage.GetHeaders(RequestHeader);
        RequestMessage.Method('POST');
        RequestMessage.Content(Content);
        // Client.SetBaseAddress(SMSSetup."Send SMS API URL");
        IsSuccessful := Client.Send(RequestMessage, Response);

        if not IsSuccessful then begin
            exit(false)
        end;

        if not Response.IsSuccessStatusCode() then begin
            Message(format(Response.HttpStatusCode()))
        end;

        Response.Content().ReadAs(ResponseText);
        //exit(true)
        // Message(ResponseText);
        Exit(true);
    end;

    procedure ClearSMSBuffer()
    begin
        SMSSender.Reset();
        SMSSender.SetRange(SMSSender.Status, SMSSender.Status::Pending);
        SMSSender.SetFilter(Date, '%1..', Today);

        if SMSSender.FindSet() then
            repeat
                if SendSMS(SMSSender."Phone No", SMSSender.Message) then begin
                    SMSSender.Status := SMSSender.status::Sent;
                    SMSSender.Modify();
                end;
            until SMSSender.Next = 0;
    end;

    var
        SMSSetup: Record "SMS Setup";
        SMSSender: Record "SMS Sender";
}
