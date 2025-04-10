Codeunit 52193488 "Notification Sender"
{

    trigger OnRun()
    begin
    end;

    var
        SenderAddress: Text[30];
        SenderName: Text[30];
        Recipients: Text[30];
        Body: Text[250];
        Subject: Text[30];
        SMTP: Codeunit "Email Message";
        Email: Codeunit Email;
        URL: Text[250];
        messageparam: Text[100];
        phoneparam: Text[100];
        position: Integer;
        url2: Text;
        position2: Integer;
        String: Text[255];
        FindWhat: Text[250];
        ReplaceWith: Text[250];
        NewString: Text[250];
        Phone: Text;
        Msg: Text;
        Url1: Text;
        Phonelength: Integer;


    procedure CreateSms(PhoneNo: Text[30]; MessageText: Text[300])
    var
        SmsTable: Record SMS1;
        LastAutoID: BigInteger;
        txtInternetAddr: Text[250];
        txtInternetAddr2: Text[250];
        SMSSetup: Record BudgetLines;
    begin
        /*SmsTable.RESET;
        //ClientSetup.GET;
        
        SMSSetup.SETRANGE(Status,SMSSetup.Status::Active);
        IF SMSSetup.FIND('+') THEN BEGIN
          URL:=SMSSetup.URL;
          messageparam :=  SMSSetup."Message Parameter";
          phoneparam := SMSSetup."Phone Parameter";
           END;
        
        IF COPYSTR(PhoneNo,1,4)=SMSSetup."Phone Prefix" THEN
        PhoneNo:=PhoneNo
        ELSE
        PhoneNo:=SMSSetup."Phone Prefix"+PhoneNo;
        
        IF SmsTable.FIND('+') THEN
        LastAutoID:=SmsTable.AUTOID;
        
        
        SmsTable.INIT;
        SmsTable.AUTOID:=LastAutoID+1;
        SmsTable.PHONENO:=PhoneNo;
        SmsTable.MESSAGE:=COPYSTR(MessageText,1,250);
        SmsTable.VENDOR:='';
        SmsTable.NETWORKNAME:='';
        SmsTable.DATESENT:=CURRENTDATETIME;
        SmsTable.SENDERID:=USERID;
        SmsTable.MESSAGEID:='';
        SmsTable.MSG_TYPE:='';
        SmsTable.PIN:='';
        SmsTable.COMMENT:='';
        SmsTable.TRANSID:='';
        SmsTable.EMPLOYER:='';
        SmsTable.INSERT;
        
         ReplaceString(URL,messageparam,MessageText,Url1);
         ReplaceString(Url1,phoneparam,PhoneNo,url2);
        
        {//*********************************   we replace the message value*************************
         position := STRPOS(URL,messageparam);
         position2 := position+STRLEN(messageparam)+1;
         url2 := INSSTR(URL,MessageText,position2);
        //*********************************   we replace the phone value*************************
         position := STRPOS(url2,phoneparam);
         position2 := position+STRLEN(phoneparam)+1;
         url2 := INSSTR(url2,PhoneNo,position2);}
         MESSAGE('%1',url2);
         {HYPERLINK(url2);}
        */

    end;


    procedure Replace(var String1: Text[255]; var String2: Text[255]; var String3: Text[255])
    var
        AantalPos: Integer;
        Deel1: Text[255];
        Deel2: Text[255];
    begin


        AantalPos := StrPos(String1, String2);
        if AantalPos <> 0 then begin
            if AantalPos > 1 then
                Deel1 := CopyStr(String1, 1, AantalPos - 1);
            if AantalPos <> StrLen(String1) - (StrLen(String2) - 1) then
                Deel2 := CopyStr(String1, AantalPos + StrLen(String2));
            String1 := Deel1 + String3 + Deel2;
        end;
    end;


    procedure ReplaceString(String: Text[250]; FindWhat: Text[250]; ReplaceWith: Text[250]; var NewString: Text[500])
    begin


        while StrPos(String, FindWhat) > 0 do
            String := DelStr(String, StrPos(String, FindWhat)) + ReplaceWith + CopyStr(String, StrPos(String, FindWhat) + StrLen(FindWhat));
        NewString := String;

        //---MESSAGE('tHE sTRING %',NewString);
    end;


    procedure SendingSMS()
    begin
        /*
        IF BatchRec.Status<>BatchRec.Status::Released THEN
          ERROR(Text100);
        BatchRec.CALCFIELDS(Sent);
        IF BatchRec.Sent THEN
          ERROR(Text110);
        
        
        SmsTable.RESET;
        SmsTable.SETRANGE("Batch No",BatchRec."Batch No");
        SmsTable.SETRANGE(Sent,FALSE);
         IF SmsTable.FIND('-') THEN
           REPEAT
            //SmsNet:=SmsNet.SMS;
            IF SMSSetup.GET(BatchRec."SMS Vendor") THEN BEGIN
               URL:=SMSSetup.URL;
               messageparam :=  SMSSetup."Message Parameter";
               phoneparam := SMSSetup."Phone Parameter";
            END;
            SmsTable.CALCFIELDS("SMS URL");
            SmsTable."SMS URL".CREATEINSTREAM(SmsStream);
            SmsMessage.READ(SmsStream);
        
            ReplaceString(URL,messageparam,FORMAT(SmsMessage),Url1);
            ReplaceString(Url1,phoneparam,SmsTable.PHONENO,url2);
        
            //SmsNet.DownloadString(url2);
        
            SmsTable.Sent := TRUE;
            SmsTable.DATESENT:=CURRENTDATETIME;
            SmsTable.SENDERID:=USERID;
            SmsTable.MODIFY;
           UNTIL
            SmsTable.NEXT=0;
        BatchRec.CALCFIELDS(Sent);
        
        IF BatchRec.Sent THEN
         MESSAGE(Text108)
        ELSE
         MESSAGE(Text109);
        */

    end;


    procedure GenerateSmsNotification(Client: Record Customer; NotificationType: Integer; AdditionalMessage: array[10] of Text)
    begin
        /*
       FullMessage:='';
       PhoneNo:='';

       //ClientSetup.GET;
       MessageTypeRec.RESET;
       MessageTypeRec.SETRANGE(MessageTypeRec."Source Type",NotificationType);
       IF MessageTypeRec.FIND('-') THEN
       BEGIN
       IF NotificationType=5 THEN
       FullMessage:=STRSUBSTNO(MessageTypeRec."SMS MESSAGE",Client."Last Name",Client."No.",AdditionalMessage[1],AdditionalMessage[2])
       ELSE IF ((NotificationType=6 )OR (NotificationType=11) OR (NotificationType=10) OR (NotificationType=16) OR (NotificationType=19)) THEN
       FullMessage:=STRSUBSTNO(MessageTypeRec."SMS MESSAGE",Client."No.",AdditionalMessage[1],AdditionalMessage[2])
       ELSE
       FullMessage:=STRSUBSTNO(MessageTypeRec."SMS MESSAGE",Client.Title,Client."Last Name");
       PhoneNo:=Client."Mobile 1";
       IF PhoneNo='' THEN
       PhoneNo:=Client."Mobile 1";

       IF SMSSetup.GET(SmsBatch."SMS Vendor") THEN BEGIN
          URL:=SMSSetup.URL;
          messageparam :=  SMSSetup."Message Parameter";
          phoneparam := SMSSetup."Phone Parameter";
       END;

         Delimeter:=0;

         IF Delimeter=0 THEN
         Delimeter:=STRPOS(PhoneNo,'!');
          IF Delimeter=0 THEN
         Delimeter:=STRPOS(PhoneNo,'Âº);
          IF Delimeter=0 THEN
         Delimeter:=STRPOS(PhoneNo,'$');
          IF Delimeter=0 THEN
         Delimeter:=STRPOS(PhoneNo,'%');
          IF Delimeter=0 THEN
         Delimeter:=STRPOS(PhoneNo,'&');
         IF Delimeter=0 THEN
         Delimeter:=STRPOS(PhoneNo,'#');
         IF Delimeter=0 THEN
         Delimeter:=STRPOS(PhoneNo,'@');
         IF Delimeter=0 THEN
         Delimeter:=STRPOS(PhoneNo,'/');
          IF Delimeter=0 THEN
         Delimeter:=STRPOS(PhoneNo,'?');
          IF Delimeter=0 THEN
         Delimeter:=STRPOS(PhoneNo,'>');
         IF Delimeter=0 THEN
         Delimeter:=STRPOS(PhoneNo,'<');
          IF Delimeter=0 THEN
         Delimeter:=STRPOS(PhoneNo,'\');
         IF Delimeter=0 THEN
         Delimeter:=STRPOS(PhoneNo,';');

         IF Delimeter=0 THEN
         Delimeter:=STRPOS(PhoneNo,' ');

       IF Delimeter<>0 THEN
       PhoneNo:=COPYSTR(PhoneNo,1,Delimeter);



       Phonelength:=STRLEN(PhoneNo);



       Prefix :=SMSSetup."Phone Prefix";

       IF COPYSTR(PhoneNo,1,1)='0' THEN BEGIN
       PhoneNo:=COPYSTR(PhoneNo,2,10);
       Prefix :=SMSSetup."Phone Prefix";
       //VOO
       END
       ELSE IF COPYSTR(PhoneNo,1,3)='254' THEN  BEGIN
       PhoneNo:=COPYSTR(PhoneNo,4,10);
       Prefix:=SMSSetup."Phone Prefix";
       END
       ELSE IF COPYSTR(PhoneNo,1,4)=SMSSetup."Phone Prefix" THEN BEGIN
       PhoneNo:=COPYSTR(PhoneNo,5,10);
       Prefix:=SMSSetup."Phone Prefix";
       //International Numbers
       END
       ELSE IF (COPYSTR(PhoneNo,1,4)<>SMSSetup."Phone Prefix") AND (COPYSTR(PhoneNo,1,1)='+') THEN BEGIN
       PhoneNo:=SELECTSTR(1,PhoneNo);
       Prefix:='';
       END;
       IF PhoneNo<>'' THEN BEGIN
       PhoneNo:=Prefix+PhoneNo;
       PhoneNo:=COPYSTR(PhoneNo,1,30);
       END;
       //*********************************   we replace the phone value*************************

       ReplaceString(URL,messageparam,FullMessage,Url1);
       ReplaceString(Url1,phoneparam,PhoneNo,url2);

       SmsTable.INIT;
       IF NOT SmsTable.FIND('+') THEN
       SmsTable.AUTOID:=1
       ELSE
       LastAutoID:=SmsTable.AUTOID;
       SmsTable.AUTOID:=LastAutoID+1;
       SmsTable.PHONENO:=PhoneNo;
       SmsTable.MESSAGE:=COPYSTR(FullMessage,1,250);
       SmsMessage.ADDTEXT(FullMessage);
       SmsTable."SMS URL".CREATEOUTSTREAM(SmsStream);
       SmsMessage.WRITE(SmsStream);
       SmsTable.Sent := FALSE;
       SmsTable.VENDOR:='';
       SmsTable.NETWORKNAME:='';
       SmsTable.DATESENT:=0DT;
       //SmsTable.SENDERID:=USERID;
       SmsTable.MESSAGEID:='';
       SmsTable.MSG_TYPE:='';
       SmsTable.PIN:='';
       SmsTable.COMMENT:='';
       SmsTable.TRANSID:='';
       SmsTable.EMPLOYER:='';
       SmsTable."Batch No":=SmsBatch."Batch No";
       SmsTable."Source Type":=MessageTypeRec."Source Type";
       SmsTable."Member No":=Client."No.";
       IF PhoneNo<>'' THEN
       SmsTable.INSERT;

       END
       ELSE
       ERROR('Notification message is not set');
       */

    end;


    procedure TNSExclusion(MemberRec: Record Customer; SourceType: Integer; AlertType: Integer): Boolean
    begin

        /*//Check Employer Exclusion
         EmployerExclusion.RESET;
         EmployerExclusion.SETRANGE("Employer No",MemberRec."Employer No.");
         EmployerExclusion.SETRANGE("Source Type",SourceType);
         EmployerExclusion.SETFILTER("Alert Type",'%1|%2',AlertType,2);
           IF EmployerExclusion.FIND('-') THEN
             EXIT(TRUE);
        
        //Check Client Exclusion
         ClientExclusion.RESET;
         ClientExclusion.SETRANGE(PIN,MemberRec."P.I.N");
         ClientExclusion.SETRANGE("Source Type",SourceType);
         ClientExclusion.SETFILTER("Alert Type",'%1|%2',AlertType,2);
          IF ClientExclusion.FIND('-') THEN
            EXIT(TRUE)
           ELSE
            EXIT(FALSE);
         */

    end;


    procedure WelcomeNotification(Client: Record Vendor; NumbersOnly: Boolean; var Password: Text)
    var
        RandomInt: Integer;
        RandomTxt: Text[30];
    begin
        /*ClientSetup.GET;
        IF WebUser.GET(Client."No.") THEN
        BEGIN
          IF NumbersOnly THEN
          Password:=PassGenerator.GeneratePassword(6,FALSE,FALSE,TRUE,FALSE)
          ELSE
          Password:=PassGenerator.GeneratePassword(6,TRUE,TRUE,TRUE,FALSE);
          WebUser.Password:=Password;
          WebUser.VALIDATE(WebUser.Password);
          WebUser.P_I_N := Client."P.I.N";
          WebUser.MODIFY;
          Notifications.SendWelcomeNotificationMail(Client,Password);
        END
        ELSE
        BEGIN
        WebUser.INIT;
        WebUser."User ID":=Client."No.";
        IF NumbersOnly THEN
        Password:=PassGenerator.GeneratePassword(6,FALSE,FALSE,TRUE,FALSE)
        ELSE
        Password:=PassGenerator.GeneratePassword(6,TRUE,TRUE,TRUE,FALSE);
        WebUser.Password:=Password;
        WebUser.VALIDATE(WebUser.Password);
        WebUser.P_I_N := Client."P.I.N";
        WebUser.USER_LOCKED:='F';
        WebUser.INSERT;
        Notifications.SendWelcomeNotificationMail(Client,Password);
        END;*/

    end;


    procedure UpdateNotificationsMembApp(MessageRec: Record ActivityNotes; Client: Record "Job Planning Line"; ClientEmail: Text)
    var
        SentNotifications: Record BudgetItemTypes;
    begin

        SentNotifications.Init;
        SentNotifications.BudgetItemTypeID := 0;
        //SentNotifications."Client No." := Client."No.";
        SentNotifications.BudgetItemTypeName := ClientEmail;
        //SentNotifications."DateTime Sent" := CreateDatetime(Today, Time);
        //SentNotifications."Sent by" := UserId;
        SentNotifications.Insert;
    end;


    procedure UpdateNotificationsMember(MessageRec: Record ActivityNotes; Client: Record "Job Planning Line")
    var
        SentNotifications: Record BudgetItemTypes;
    begin

        SentNotifications.Init;
        SentNotifications.BudgetItemTypeID := 0;
        //SentNotifications."Client No." := Client."No.";
        //SentNotifications."Email Address":=Client."E-Mail";
        //SentNotifications."DateTime Sent" := CreateDatetime(Today, Time);
        //SentNotifications."Sent by" := UserId;
        SentNotifications.Insert;
    end;


    procedure SendSMS(MessageText: Text; id: BigInteger; PhoneNo: Text) Sent: Boolean
    begin
        /*SMSSetup.SETRANGE(Status,SMSSetup.Status::Active);
        IF SMSSetup.FIND('+') THEN BEGIN
          URL:=SMSSetup.URL;
          messageparam :=  SMSSetup."Message Parameter";
          phoneparam := SMSSetup."Phone Parameter";
        END;
        ReplaceString(URL,messageparam,MessageText,url1);
        ReplaceString(url1,phoneparam,PhoneNo,url2);
        
        //HYPERLINK(url2);
        SmsNet:=SmsNet.SMS;
        SmsNet.DownloadString(url2);
        IF SMSEntry.GET(id) THEN BEGIN
         SMSEntry.Sent := TRUE;
         SMSEntry.MODIFY;
        END;
        SLEEP(10);
        */

    end;


    procedure CreateSMSContactCentre(var PhoneNo: Text[20]; var MessageText: Text)
    begin
        /*
        //// New Code 08/11/2012
        SmsTable.RESET;
        ClientSetup.GET;
        
        SMSSetup.SETRANGE(Status,SMSSetup.Status::Active);
        IF SMSSetup.FIND('+') THEN BEGIN
          URL:=SMSSetup.URL;
          messageparam :=  SMSSetup."Message Parameter";
        
          phoneparam := SMSSetup."Phone Parameter";
           END;
        
        
        Phonelength:=STRLEN(PhoneNo);
        Prefix :=SMSSetup."Phone Prefix";
        
        IF COPYSTR(PhoneNo,1,1)='0' THEN BEGIN
        PhoneNo:=COPYSTR(PhoneNo,2,10);
        Prefix :=SMSSetup."Phone Prefix";
        //VOO
        END
        ELSE IF COPYSTR(PhoneNo,1,3)='234' THEN  BEGIN
        PhoneNo:=COPYSTR(PhoneNo,4,10);
        Prefix:=SMSSetup."Phone Prefix";
        END
        ELSE IF COPYSTR(PhoneNo,1,4)=SMSSetup."Phone Prefix" THEN BEGIN
        PhoneNo:=COPYSTR(PhoneNo,5,10);
        Prefix:=SMSSetup."Phone Prefix";
        END
        ELSE IF (COPYSTR(PhoneNo,1,4)<>SMSSetup."Phone Prefix") AND (COPYSTR(PhoneNo,1,1)<>'+') THEN BEGIN
        PhoneNo:=SELECTSTR(1,PhoneNo);
        Prefix:='+234';
        //International Numbers
        END
        ELSE IF (COPYSTR(PhoneNo,1,4)<>SMSSetup."Phone Prefix") AND (COPYSTR(PhoneNo,1,1)='+') THEN BEGIN
        PhoneNo:=SELECTSTR(1,PhoneNo);
        Prefix:='';
        END;
        PhoneNo:=Prefix+PhoneNo;
        
        //*********************************   we replace the phone value*************************
        
        ReplaceString(URL,messageparam,MessageText,Url1);
        ReplaceString(Url1,phoneparam,PhoneNo,url2);
        
        
        
        SmsTable.INIT;
        IF NOT SmsTable.FIND('+') THEN
        SmsTable.AUTOID:=1
        ELSE
        LastAutoID:=SmsTable.AUTOID;
        SmsTable.AUTOID:=LastAutoID+1;
        SmsTable.PHONENO:=PhoneNo;
        SmsTable.MESSAGE:=COPYSTR(MessageText,1,250);
        //SmsTable.URL := COPYSTR(url2,1,250);
        //SmsTable.Sent := FALSE;
        SmsMessage.ADDTEXT(MessageText);
        SmsTable."SMS URL".CREATEOUTSTREAM(SmsStream);
        SmsMessage.WRITE(SmsStream);
        SmsTable.VENDOR:='';
        SmsTable.NETWORKNAME:='';
        SmsTable.DATESENT:=CURRENTDATETIME;
        SmsTable.SENDERID:=USERID;
        SmsTable.MESSAGEID:='';
        SmsTable.MSG_TYPE:='';
        SmsTable.PIN:='';
        SmsTable.COMMENT:='';
        SmsTable.TRANSID:='';
        SmsTable.EMPLOYER:='';
        SmsTable.INSERT;
        
        // HYPERLINK(url2);
        
        SmsNet:=SmsNet.SMS;
        
        SmsNet.DownloadString(url2);
        SLEEP(10);
         */

    end;
}

