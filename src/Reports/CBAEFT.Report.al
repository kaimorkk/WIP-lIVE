Report 52193681 CBAEFT
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

                //BANK ACCOUNT RECORD CHECK



                //BANK ACCOUNT RECORD CHECK

                //EFT FILE NAME ASSIGNMENT
                GLSetup.Get;
                FileNo := Payments."No.";
                FileName := FileNo;

                //CREATE(xlApp);
                // Create(xlApp, false, true);
                // xlBook := xlApp.Workbooks.Add(-4167);
                // xlSheet:= xlApp.ActiveSheet;
                // xlSheet.Name := FileName;
                //   i:=1;

                // //EFT FILE DATA
                //   AmtText:=Format(NetPay);
                //   AmtText := DelChr(AmtText,'=',',');
                //   Evaluate(AccNo,BankAcc);

                //  // xlSheet.Cells.NumberFormat := '@';
                //   xlSheet.Range('A'+Format(i)).Value :=BankCode ;
                //   xlSheet.Range('B'+Format(i)).Value :=BranchCode;
                //   xlSheet.Range('E'+Format(i)).Value :=AmtText;
                //   xlSheet.Range('D'+Format(i)).Value := Name;
                //   xlSheet.Range('F'+Format(i)).Value := Text002;
                //   xlSheet.Range('C'+Format(i)).Value :=BankAcc;
                // //  xlSheet.Range('C'+FORMAT(i)).HorizontalAlignment := -4131; //xlLeft




                //   i:=i+1;
                // xlApp.Visible := false;
                // xlBook._SaveAs(GLSetup."EFT File Path"+FileName+'.csv');
                // Clear(xlBook);
                // Clear(xlApp);
                //EFT FILE DATA
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
        FieldText: Text[250];
        HeaderText: Text[200];
        LineText: Text[100];
        EFTOutstream: OutStream;
        EFTFile: File;
        CheckLedgerEntry: Record "Check Ledger Entry";
        ClosingBalance: Decimal;
        FileName: Text[30];
        EFTtext: array[8] of Text[1024];
        SpaceText: Text[30];
        ExcelBuf: Record "Excel Buffer";
        BalBankName: Text[80];

        i: Integer;
        GLSetup: Record "General Ledger Setup";
        Name: Text[250];
        NetPay: Decimal;
        BankCode: Code[20];
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
        PV_No: Code[20];
        BranchCode: Code[20];
        PVLines: Record "PV Lines1";
        FileNo: Code[20];
        Text002: label 'EFT PAYMENT';
        Text001: label 'CMA';
        AmtText: Text;
        Amt: Decimal;
        AccNo: Decimal;


    procedure GetPV(var PV: Record Payments)
    begin
        PV_No := PV."No.";
    end;
}

