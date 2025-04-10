Report 52193682 CBAEFT2
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
                PVLines.SetRange("PV No", Payments.No);
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




                AmtText := Format(NetPay);
                HeaderOutstream.WriteText(BankCode);
                HeaderOutstream.WriteText(',');
                HeaderOutstream.WriteText(BranchCode);
                HeaderOutstream.WriteText(',');
                HeaderOutstream.WriteText(BankAcc);
                HeaderOutstream.WriteText(',');
                HeaderOutstream.WriteText(AmtText);
                HeaderOutstream.WriteText(',');
                HeaderOutstream.WriteText(Name);
                HeaderOutstream.WriteText();
            end;

            trigger OnPostDataItem()
            begin


                // totals
                /*
                DecimalPos:=0;
                Diff:=0;
                AddZeros:='';
                p:=1;
                 EVALUATE(TotalsText,FORMAT(TotalAmt));
                 TotalsText:=DELCHR(TotalsText,'=',',');
                 DecimalPos:=STRPOS(TotalsText,'.');
                 IF DecimalPos >0 THEN BEGIN
                  DecimalText:=COPYSTR(TotalsText,DecimalPos+1,2);
                  DecimalLen:=STRLEN(DecimalText);
                  {IF DecimalLen=1 THEN BEGIN
                   //TotalsText:=DELCHR(TotalsText,'=','.');
                   TotalsText:=TotalsText+'0';
                  END ELSE
                   TotalsText:=DELCHR(TotalsText,'=','.');}
                 END;
                
                 TotalsLen:=STRLEN(TotalsText);
                
                TotalsText:=AddZeros+TotalsText;
                
                Window.CLOSE;
                */

            end;

            trigger OnPreDataItem()
            begin

                //LastFieldNo := FIELDNO("Posting Group");

                Clear(TranferFile);
                // TranferFile.TextMode := true;
                // TranferFile.WriteMode := true;
                //TranferFile.QUERYREPLACE := TRUE;

                FileName := No;
                //C:NTZDCEFT.txt
                // TranferFile.Create('C:\eft\13554.csv');

                // TranferFile.CreateOutstream(HeaderOutstream);
                //Window.OPEN('Processing Employee No. ##############################1',EmpNo);
                //NoOfRecord:=2;
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
        TranferFile: File;
        HeaderOutstream: OutStream;
        ReturnValue: Boolean;


    procedure GetPV(var PV: Record Payments)
    begin
        PV_No := PV.No;
    end;
}

