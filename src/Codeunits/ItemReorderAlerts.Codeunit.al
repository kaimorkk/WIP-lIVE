Codeunit 52193477 "Item Reorder Alerts"
{

    trigger OnRun()
    begin
        /*
        UserSetup.RESET;
        IF UserSetup.GET(USERID) THEN BEGIN
          UserSetup.TESTFIELD("E-Mail");
          SenderAddress := UserSetup."E-Mail";
        END;
        */

        CompanyInfo.Get();
        SenderAddress := CompanyInfo."Administrator Email";

        SenderName := COMPANYNAME;

        //NewItem.SETRANGE("Date Filter",0D,99993112D);
        NewItem.Reset;
        if NewItem.Find('-') then
            repeat
                NewItem.CalcFields(Inventory);

                Demand := AvailToPromise.CalcGrossRequirement(NewItem) + AvailToPromise.CalcReservedRequirement(NewItem);

                Supply := AvailToPromise.CalcScheduledReceipt(NewItem) + AvailToPromise.CalcScheduledReceipt(NewItem);

                QtyAvailable := NewItem.Inventory + Supply - Demand - NewItem."Safety Stock Quantity";

                if QtyAvailable <= NewItem."Reorder Point" then begin

                    Subject := StrSubstNo('Store Item %1, %2 Replenishment', NewItem."No.", NewItem.Description);
                    Body := StrSubstNo('This is to inform you that Store Item %1, %2 has reached the reorder level and needs to be replenished', NewItem."No.", NewItem.Description);

                    CompanyInfo.Get();

                    Recipients := CompanyInfo."Procurement Support E-mail";

                    SMTPSetup.Create(Recipients, Subject, Body, true);

                    Email.Send(SMTPSetup);

                end;
            until NewItem.Next = 0;

    end;

    var
        AvailToPromise: Codeunit "Available to Promise";
        Demand: Decimal;
        Supply: Decimal;
        NewItem: Record Item;
        QtyAvailable: Decimal;
        SMTPSetup: Codeunit "Email Message";
        Email: Codeunit Email;
        CompanyInfo: Record "Company Information";
        UserSetup: Record "User Setup";
        SenderAddress: Text[80];
        Recipients: Text[80];
        SenderName: Text[50];
        Body: Text[250];
        Subject: Text[80];
}

