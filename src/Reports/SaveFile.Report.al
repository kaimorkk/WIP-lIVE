Report 52193683 "Save File"
{
    ProcessingOnly = true;

    dataset
    {
        dataitem(Payments; Payments)
        {
            column(ReportForNavId_1000000000; 1000000000)
            {
            }

            trigger OnAfterGetRecord()
            begin
                if Payments."Eft Generated" then Error('EFT has already been generated for this payment');
                Payments.CalcFields("Total Amount");
                NetPay := 0;
                NetPay := Payments."Total Amount";
                PVLines.Reset;
                PVLines.SetRange("PV No", Payments."No.");
                if PVLines.Find('-') then begin
                    Name := PVLines."Account Name";
                    Name := DelChr(Name, '=', '.');
                    Name := PadStr(Name, 20, ' ');
                    BankName := '';

                    BranchName := '';

                    case PVLines."Account Type" of
                        PVLines."account type"::Vendor:
                            begin
                                VendBank.Reset;
                                VendBank.SetRange("Vendor No.", PVLines."Account No");
                                if VendBank.Find('-') then begin
                                    BankName := VendBank.Name;
                                    BankCode := VendBank.Code;
                                    BranchCode := VendBank."Bank Branch No.";
                                    BranchName := VendBank."Name 2";
                                    Amtlen2 := StrLen(VendBank."Bank Account No.");

                                    Amtlen := StrLen(AmountTxt);
                                    Space := '';
                                    i := 0;
                                    j := 0;
                                    i := 12 - (Amtlen + 1);
                                    if j < i then
                                        repeat
                                            Space := Space + ' ';
                                            j := j + 1;
                                        until j = i;
                                    AmountTxt := Space + AmountTxt;


                                    Space2 := '';
                                    i := 0;
                                    j := 0;
                                    i := 14 - (Amtlen2);
                                    if j < i then
                                        repeat
                                            if i = 1 then
                                                Space2 := ' '
                                            else
                                                Space2 := Space2 + ' ';

                                            j := j + 1;
                                        until j = i;


                                    BankAcc := Space2 + DelChr(VendBank."Bank Account No.", '=', ' ');
                                end;
                            end;
                        PVLines."account type"::Customer:
                            begin
                                CustBank.Reset;
                                CustBank.SetRange("Customer No.", PVLines."Account No");
                                if CustBank.Find('-') then begin
                                    BankName := CustBank.Name;
                                    BankCode := CustBank.Code;
                                    BranchCode := CustBank."Bank Branch No.";
                                    BranchName := CustBank."Name 2";
                                    Amtlen2 := StrLen(CustBank."Bank Account No.");

                                    Amtlen := StrLen(AmountTxt);
                                    Space := '';
                                    i := 0;
                                    j := 0;
                                    i := 12 - (Amtlen + 1);
                                    if j < i then
                                        repeat
                                            Space := Space + ' ';
                                            j := j + 1;
                                        until j = i;
                                    AmountTxt := Space + AmountTxt;


                                    Space2 := '';
                                    i := 0;
                                    j := 0;
                                    i := 14 - (Amtlen2);
                                    if j < i then
                                        repeat
                                            if i = 1 then
                                                Space2 := ' '
                                            else
                                                Space2 := Space2 + ' ';

                                            j := j + 1;
                                        until j = i;


                                    BankAcc := Space2 + DelChr(CustBank."Bank Account No.", '=', ' ');
                                end;
                            end;
                    end;
                end;
                AmtText := Format(NetPay);
                AmtText := DelChr(AmtText, '=', ',');
                /// ISSERVICETIER checks whether the code is running on the RoleTailored client.
                // If so, create a temporary file on NAV server, write the content // to the tempoary file, and then create an instream for the
                // temporary file.

                //  ToFile:=No+'.csv';

                if ISSERVICETIER then begin
                    // TempFile.CreateTempfile();
                    // TempFile.CREATE('C:\EFT\'+No+'.csv');
                    // TempFile.Write(BankCode);
                    // TempFile.Write(',');
                    // TempFile.Write(BranchCode);
                    // TempFile.Write(',');
                    // TempFile.Write(BankAcc);
                    // TempFile.Write(',');
                    // TempFile.Write(Name);
                    // TempFile.Write(',');
                    // TempFile.Write(AmtText);
                    // TempFile.Write(',');
                    // TempFile.Write(Text002);

                    // TempFile.CreateInstream(NewStream);
                    ToFile := "No." + '.csv';

                    // Tranfer the content from the temporary file on the NAV server to a file on the RoleTailored client.

                    ReturnValue := DownloadFromStream(
                                NewStream,
                                'Save File to RoleTailored Client',
                                '',
                                'Text File *.txt| *.txt',
                                ToFile);    // Close the temporary file and delete it from NAV server.


                    // TempFile.Close();


                end;
                Payments."Eft Generated" := true;
                Payments.Modify;

                // Post a message indicating that the file is saved on the client.

                //MESSAGE(FORMAT(ToFile));
            end;

            trigger OnPreDataItem()
            begin
                /*
                TempFile.TEXTMODE := TRUE;
                TempFile.WRITEMODE := TRUE;
                TempFile.CREATE('C:\EFT\'+No+'csv');
                */

            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        Name: Text[200];
        ReturnValue: Boolean;
        TempFile: File;
        ToFile: Variant;
        NewStream: InStream;
        NetPay: Decimal;
        BankCode: Text[2];
        RefNo: Code[50];
        AmountTxt: Text[30];
        payroll: Codeunit Payroll5;
        Amtlen: Integer;
        Space: Text[12];
        j: Integer;
        BankAcc: Text[15];
        Amtlen2: Integer;
        Space2: Text[15];
        BankName: Text[50];
        BranchName: Text[50];
        VendBank: Record "Vendor Bank Account";
        TotalNet: Decimal;
        PV_No: Code[10];
        BranchCode: Text[3];
        PVLines: Record "PV Lines1";
        FileNo: Code[20];
        i: Integer;
        Text002: label 'EFT PAYMENT';
        Text001: label 'CMA';
        AmtText: Text[30];
        CustBank: Record "Customer Bank Account";
}

