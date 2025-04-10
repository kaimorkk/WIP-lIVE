/// <summary>
/// Codeunit Sharepoint Integration (ID 50038).
/// </summary>
codeunit 50038 "Sharepoint Integration"
{
    /// <summary>
    /// UploadDocument.
    /// </summary>
    /// <param name="Base64String">Text.</param>
    /// <param name="FileName">Text.</param>
    /// <param name="DocumentType">Enum SharepointDocumentType.</param>
    /// <param name="DocumentNo">Text.</param>
    /// <param name="RecID">RecordId.</param>
    /// <param name="Module">Text.</param>
    /// <param name="TableId">Integer.</param>
    ///<param name="Desc"></param>
    /// <returns>Return value of type Boolean.</returns>
    procedure UploadDocument(Base64String: Text; FileName: Text; DocumentType: Enum SharepointDocumentType; DocumentNo: Text; RecID: RecordId; Module: Text; TableId: Integer; Desc: Text): Text;
    var
        Client: HttpClient;
        Request: HttpRequestMessage;
        Response: HttpResponseMessage;
        Content: HttpContent;
        RequestHeader: HttpHeaders;
        ContentHeader: HttpHeaders;
        Res: Text;
        JMessage, JResponse : JsonObject;
        Logs: Record "Integration logs";
        RecLink: Record "Record Link";
        JToken: JsonToken;
        sharePointUrl: Text;
        docId: Text;
    begin
        Clear(Client);
        Clear(Request);
        Clear(RequestHeader);
        Clear(Content);
        Clear(ContentHeader);
        Clear(Res);
        docId := '';
        sharePointUrl := getUrl('SHAREPOINTURL');

        JMessage.Add('FileBase64String', Base64String);
        JMessage.Add('FileName', FileName);
        JMessage.Add('DocumentType', Format(DocumentType));
        JMessage.Add('DocumentNo', DocumentNo);
        JMessage.Add('Module', Module);
        JMessage.Add('TableId', Format(TableId));
        JMessage.Add('Description', Desc);

        Content.WriteFrom(Format(JMessage));

        Content.GetHeaders(ContentHeader);
        ContentHeader.Remove('Content-Type');
        ContentHeader.Add('Content-Type', 'application/json');

        Request.GetHeaders(RequestHeader);
        RequestHeader.Remove('Accept');
        RequestHeader.Add('Accept', 'application/json');
        Request.GetHeaders(RequestHeader);
        Request.Content(Content);
        Request.Method('POST');
        Client.SetBaseAddress(sharePointUrl);
        if Client.Send(Request, Response) then begin
            if Response.Content().ReadAs(Res) then begin
                if Response.IsSuccessStatusCode then begin
                    if not JResponse.ReadFrom(Res) then
                        Error('Failed to parse response');
                    if JResponse.Get('document_id', JToken) then begin
                        RecLink.Init();
                        RecLink."Record ID" := RecID;
                        RecLink.Description := FileName;
                        RecLink.URL1 := JToken.AsValue().AsText();
                        docId := JToken.AsValue().AsText();
                        RecLink.Insert(true);
                        exit(docId);
                    end
                    // Message(Res);

                end else begin
                    Logs.Init();
                    Logs."Status Message" := CopyStr(Res, 1, 2048);
                    Logs."Document No" := DocumentNo;
                    Logs.Insert();

                end;
            end else begin
                Logs.Init();
                Logs."Status Message" := GetLastErrorText();
                Logs."Document No" := DocumentNo;
                Logs.Insert();
            end;
        end else begin
            Logs.Init();
            Logs."Status Message" := GetLastErrorText();
            Logs."Document No" := DocumentNo;
            Logs.Insert();
        end;
    end;

    /// <summary>
    /// GetDocument.
    /// </summary>
    /// <param name="DocumentType">Enum SharepointDocumentType.</param>
    /// <param name="DocumentNo">Text.</param>
    /// <param name="RecID">RecordId.</param>
    /// <param name="Module">Text.</param>
    /// <param name="TableId">Integer.</param>
    /// <param name="Desc">Text.</param>
    procedure GetDocument(DocumentType: Enum SharepointDocumentType; DocumentNo: Text; RecID: RecordId; Module: Text; TableId: Integer; Desc: Text)
    var
        Ins: InStream;
        Filename: Text;
        Base64: Codeunit "Base64 Convert";
        Base64String: Text;
    begin
        if UploadIntoStream('Choose File', '', '', Filename, Ins) then begin
            Base64String := Base64.ToBase64(Ins);
            if UploadDocument(Base64String, Filename, DocumentType, DocumentNo, RecID, Module, TableId, Desc) = '' then
                Error('Failed to upload document');
        end;
    end;

    procedure GetDocument(DocumentType: Enum SharepointDocumentType; DocumentNo: Text; RecID: RecordId; Module: Text; TableId: Integer; Desc: Text; RecordLinkId: Integer): Boolean
    var
        Ins: InStream;
        Filename: Text;
        Base64: Codeunit "Base64 Convert";
        Base64String: Text;
    begin
        if UploadIntoStream('Choose File', '', '', Filename, Ins) then begin
            Base64String := Base64.ToBase64(Ins);
            if not UploadDocument(Base64String, Filename, DocumentType, DocumentNo, RecID, Module, TableId, Desc, RecordLinkId) then
                Error('Failed to upload document')
            else
                exit(true);
        end;
    end;

    procedure UploadDocument(Base64String: Text; FileName: Text; DocumentType: Enum SharepointDocumentType; DocumentNo: Text; RecID: RecordId; Module: Text; TableId: Integer; Desc: Text; RecordLinkId: Integer): Boolean
    var
        Client: HttpClient;
        Request: HttpRequestMessage;
        Response: HttpResponseMessage;
        Content: HttpContent;
        RequestHeader: HttpHeaders;
        ContentHeader: HttpHeaders;
        Res: Text;
        JMessage, JResponse : JsonObject;
        Logs: Record "Integration logs";
        RecLink: Record "Record Link";
        JToken: JsonToken;
        sharePointUrl: Text;
    begin
        Clear(Client);
        Clear(Request);
        Clear(RequestHeader);
        Clear(Content);
        Clear(ContentHeader);
        Clear(Res);
        sharePointUrl := getUrl('SHAREPOINTURL');

        JMessage.Add('FileBase64String', Base64String);
        JMessage.Add('FileName', FileName);
        JMessage.Add('DocumentType', Format(DocumentType));
        JMessage.Add('DocumentNo', DocumentNo);
        JMessage.Add('Module', Module);
        JMessage.Add('TableId', Format(TableId));
        JMessage.Add('Description', Desc);

        Content.WriteFrom(Format(JMessage));

        Content.GetHeaders(ContentHeader);
        ContentHeader.Remove('Content-Type');
        ContentHeader.Add('Content-Type', 'application/json');

        Request.GetHeaders(RequestHeader);
        RequestHeader.Remove('Accept');
        RequestHeader.Add('Accept', 'application/json');
        Request.GetHeaders(RequestHeader);
        Request.Content(Content);
        Request.Method('POST');
        Client.SetBaseAddress(sharePointUrl);
        if Client.Send(Request, Response) then begin
            if Response.Content().ReadAs(Res) then begin
                if Response.IsSuccessStatusCode then begin
                    if not JResponse.ReadFrom(Res) then
                        Error('Failed to parse response');
                    if JResponse.Get('document_id', JToken) then begin
                        if RecLink.Get(RecordLinkId) then begin
                            RecLink.URL1 := JToken.AsValue().AsText();
                            RecLink.Modify();
                        end;
                        exit(true);
                    end else
                        Message(Res);

                end else begin
                    Logs.Init();
                    Logs."Status Message" := CopyStr(Res, 1, 2048);
                    Logs."Document No" := DocumentNo;
                    Logs.Insert();

                end;
            end else begin
                Logs.Init();
                Logs."Status Message" := GetLastErrorText();
                Logs."Document No" := DocumentNo;
                Logs.Insert();
            end;
        end else begin
            Logs.Init();
            Logs."Status Message" := GetLastErrorText();
            Logs."Document No" := DocumentNo;
            Logs.Insert();
        end;
    end;


    local procedure LogToDatabase(StatusMessage: Text; DocumentNo: Text; Success: Boolean);
    begin
        Logs.Init();
        Logs."Status Message" := CopyStr(StatusMessage, 1, 2048);
        Logs."Document No" := DocumentNo;
        Logs.Success := Success;
        Logs.Insert();
    end;

    procedure RetrieveDocument(Module: Text; DocumentNo: Text; DocType: Text; DocId: Text): Text
    var
        Client: HttpClient;
        Request: HttpRequestMessage;
        Response: HttpResponseMessage;
        Content: HttpContent;
        RequestHeader: HttpHeaders;
        ContentHeader: HttpHeaders;
        Res: Text;
        Jtoken: JsonToken;
        JMessage, JResponse : JsonObject;
        StatusCode: Text;
        valueJtoken: JsonToken;
        ResponseLogMessage: Text;
        fileBase64str: Text;
    begin
        Clear(Client);
        Clear(Request);
        Clear(RequestHeader);
        Clear(Content);
        Clear(ContentHeader);
        Clear(Res);
        Clear(JMessage);
        getSharepointUrls();
        fileBase64str := '';

        JMessage.Add('DocumentType', Format(DocType));
        JMessage.Add('DocumentNo', DocumentNo);
        JMessage.Add('Module', Module);
        JMessage.Add('document_id', DocId);
        Content.WriteFrom(Format(JMessage));
        Content.GetHeaders(ContentHeader);
        ContentHeader.Remove('Content-Type');
        ContentHeader.Add('Content-Type', 'application/json');
        Request.GetHeaders(RequestHeader);
        RequestHeader.Remove('Accept');
        RequestHeader.Add('Accept', 'application/json');
        Request.GetHeaders(RequestHeader);
        Request.Content(Content);
        Request.Method('POST');
        Client.SetBaseAddress(retrieveDocUrl);

        if Client.Send(Request, Response) then begin
            if Response.Content().ReadAs(Res) then begin
                if Response.IsSuccessStatusCode then begin
                    if Jtoken.ReadFrom(Res) and Jtoken.IsObject then begin
                        JResponse := Jtoken.AsObject();
                        // StatusCode := OutwardPayment.ExtractTextFromJson(JResponse, valueJtoken, 'status_code');
                        JResponse.WriteTo(ResponseLogMessage);
                        fileBase64str := HandleRetrievalResponse(StatusCode, ResponseLogMessage, DocumentNo, JResponse);
                    end;
                end else begin
                    LogToDatabase(CopyStr(Res, 1, 2048), DocumentNo, false);
                end;
            end else begin
                LogToDatabase(GetLastErrorText(), DocumentNo, false);
            end;
        end else begin
            LogToDatabase(GetLastErrorText(), DocumentNo, false);
        end;

        exit(fileBase64str);
    end;

    local procedure HandleRetrievalResponse(statusCode: Text; ResponseLogMessage: Text; DocNumber: Text; JResponse: JsonObject): Text
    var
        jtoken: JsonToken;
        fileBase64: Text;
    begin
        fileBase64 := '';

        case StatusCode of
            '0':
                begin
                    if JResponse.get('FileBase64String', jtoken) then
                        fileBase64 := jtoken.AsValue().AsText();
                    LogToDatabase(CopyStr(ResponseLogMessage, 1, 2048), DocNumber, true);
                end;
            '1':
                begin
                    LogToDatabase(CopyStr(ResponseLogMessage, 1, 2048), DocNumber, true);
                end;
        end;

        exit(fileBase64);
    end;

    procedure getUrl(typeDoc: Text): Text

    begin
        smsSetup.get();
        smsSetup.TestField(smsSetup.SharePointUrl);
        // smsSetup.TestField(smsSetup.deleteSharepointUrl);
        if (UpperCase(typeDoc) = 'DELETE') then exit(smsSetup.deleteSharepointUrl);
        if (UpperCase(typeDoc) = 'SHAREPOINTURL') then exit(smsSetup.SharePointUrl);
    end;


    procedure getSharepointUrls()

    begin
        smsSetup.get();
        smsSetup.TestField(retrieveUrl);
        retrieveDocUrl := smsSetup.retrieveUrl;

    end;




    procedure getCtsOrder(docId: Integer; supportDoc: Text; pvNo: Text): Text

    begin
        smsSetup.get();
        smsSetup.TestField(smsSetup.CourtOrderUrl);
        CourtOrderUrl := smsSetup.CourtOrderUrl + Format(docId) + '&dt=' + supportDoc + '&pv_no=' + pvNo;
        exit(CourtOrderUrl)
    end;


    procedure deleteSharepointAttachment(docID: Text[100]): Boolean;
    var
        Client: HttpClient;
        Request: HttpRequestMessage;
        Response: HttpResponseMessage;
        Content: HttpContent;
        RequestHeader: HttpHeaders;
        ContentHeader: HttpHeaders;
        Res: Text;
        JMessage, JResponse : JsonObject;
        // Logs: Record "Outward integration Logs";
        RecLink: Record "Attachments";
        JToken: JsonToken;
        sharePointUrl: Text;
        isSuccess: Boolean;
        StatusCode: Integer;
    begin
        Clear(Client);
        Clear(Request);
        Clear(RequestHeader);
        Clear(Content);
        Clear(ContentHeader);
        Clear(Res);
        sharePointUrl := getUrl('DELETE');


        JMessage.Add('document_Id', docID);

        Content.WriteFrom(Format(JMessage));

        Content.GetHeaders(ContentHeader);
        ContentHeader.Remove('Content-Type');
        ContentHeader.Add('Content-Type', 'application/json');

        Request.GetHeaders(RequestHeader);
        RequestHeader.Remove('Accept');
        RequestHeader.Add('Accept', 'application/json');
        Request.GetHeaders(RequestHeader);
        Request.Content(Content);
        Request.Method('POST');
        Client.SetBaseAddress(sharePointUrl);
        if Client.Send(Request, Response) then begin
            if Response.Content().ReadAs(Res) then begin
                if Response.IsSuccessStatusCode then begin
                    if Jtoken.ReadFrom(Res) and Jtoken.IsObject then begin
                        JResponse := Jtoken.AsObject();
                        StatusCode := ExtractTextFromJson(JResponse, Jtoken, 'status_code');
                        if (statusCode = 0) then
                            exit(true)
                        else if (statusCode = 1) then
                            exit(true)
                        else
                            exit(false);
                    end
                    else begin
                        Message('An Error Occured!, Try Again')
                    end;
                end;
            end else begin
                Message('An Error Occured!, Try Again')
            end;
        end else begin
            Message('An Error Occured!, Try Again')

        end;

    end;



    local procedure DeleteAttachmentDetails(docID: Text[50]; lineNumber: Integer): Boolean;
    var
        attachments: Record "Attachments";
    begin
        attachments.reset();
        attachments.SetRange(DocumentID, docID);
        attachments.setRange(LineNo, lineNumber);
        if attachments.FindFirst() then begin
            if attachments.delete() then
                exit(true)
            else
                exit(false);
        end



    end;

    Procedure ExtractTextFromJson(resObj: JsonObject; resToken: JsonToken; value: text): Integer;
    var
        result: Integer;
    begin
        if resObj.get(value, resToken) then begin
            result := resToken.AsValue().AsInteger();
            exit(result)
        end
        else
            exit(1);
    end;



    var
        sharePointUrl: Text;
        smsSetup: Record "SMS Setup";

        CourtOrderUrl: Text;

        retrieveDocUrl: Text;
        // OutwardPayment: Codeunit OutwardPayment;
        Logs: Record "Integration logs";






}
