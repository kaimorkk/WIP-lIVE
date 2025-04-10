Table 52193677 "PV Lines1"
{
    DrillDownPageID = "PV Lines";
    LookupPageID = "PV Lines";

    fields
    {
        field(1;"PV No";Code[20])
        {

            trigger OnValidate()
            begin
                PV.Reset;
                if PV.Get("PV No") then
                 begin
                  if PV."Account Type"=PV."account type"::Vendor then
                   begin
                    "Account Type":="account type"::Vendor;
                    "Account No":=PV."Account No.";
                    "Account Name":=PV."Account Name";
                   end else
                  if PV."Account Type"=PV."account type"::Customer then
                   begin
                    "Account Type":="account type"::Customer;
                    "Account No":=PV."Account No.";
                    "Account Name":=PV."Account Name";
                   end else
                   begin
                    "Account Type":="account type"::"G/L Account";
                    "Account No":='';
                   end;
                 end;
            end;
        }
        field(2;"Account Type";Option)
        {
            Caption = 'Account Type';
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,IC Partner';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner";
        }
        field(3;"Account No";Code[100])
        {
            Caption = 'Account No.';
            TableRelation = if ("Account Type"=const("G/L Account")) "G/L Account"
                            else if ("Account Type"=const(Customer)) Customer
                            else if ("Account Type"=const(Vendor)) Vendor
                            else if ("Account Type"=const("Bank Account")) "Bank Account"
                            else if ("Account Type"=const("Fixed Asset")) "Fixed Asset"
                            else if ("Account Type"=const("IC Partner")) "IC Partner";

            trigger OnValidate()
            begin


                if "Account Type" in ["account type"::"G/L Account","account type"::Customer,"account type"::Vendor,"account type"::"IC Partner","account type"::"Bank Account"]
                then

                case "Account Type" of
                  "account type"::"G/L Account":
                    begin
                      GLAcc.Get("Account No");
                      "Account Name":=GLAcc.Name;
                      Description:=GLAcc.Name;
                      if not GLAcc."Direct Posting" then
                      Error('You cannot select a control account');
                     // "VAT Code":=RecPayTypes."VAT Code";
                     // "Withholding Tax Code":=RecPayTypes."Withholding Tax Code";
                     // "Global Dimension 1 Code":='';
                    end;
                  "account type"::Customer:
                    begin
                      Cust.Get("Account No");
                      "Account Name":=Cust.Name;
                      Description:=Cust.Name;
                      //"VAT Code":=Cust."Default VAT Code";
                      //"Withholding Tax Code":=Cust."Default Withholding Tax Code";
                      //"Global Dimension 1 Code":=Cust."Global Dimension 1 Code";
                      //Payee:="Account Name";
                      "KBA Branch Code":=Cust."KBA Code";
                      "Bank Account No":=Cust."Our Account No.";

                    end;
                  "account type"::Vendor:
                    begin
                      Vend.Get("Account No");
                      "Account Name":=Vend.Name;
                      Description:=Vend.Name;
                      //"VAT Code":=Vend."Default VAT Code";
                      //"Withholding Tax Code":=Vend."Withholding Tax Code";
                      //"KBA Branch Code":=Vend."KBA Code";
                      //"Bank Account No":=Vend."Our Account No.";

                      //"Global Dimension 1 Code":=Vend."Global Dimension 1 Code";
                      //Payee:="Account Name";

                    end;
                  "account type"::"Bank Account":
                    begin
                      BankAcc.Get("Account No");
                      "Account Name":=BankAcc.Name;
                      Description:=BankAcc.Name;
                     // "VAT Code":=RecPayTypes."VAT Code";
                     // "Withholding Tax Code":=RecPayTypes."Withholding Tax Code";
                     // "Global Dimension 1 Code":=BankAcc."Global Dimension 1 Code";

                    end;
                  "account type"::"Fixed Asset":
                    begin
                      FA.Get("Account No");
                      "Account Name":=FA.Description;
                      Description:=FA.Description;
                      //"VAT Code":=FA."Default VAT Code";
                      //"Withholding Tax Code":=FA."Default Withholding Tax Code";
                      // "Global Dimension 1 Code":=FA."Global Dimension 1 Code";

                    end;
                end;
                //VALIDATE(Payee);
            end;
        }
        field(4;"Account Name";Text[150])
        {
        }
        field(5;Description;Text[250])
        {

            trigger OnValidate()
            begin
                /*
                IF PV.GET("PV No") THEN BEGIN
                  "Account Type":=PV."Account Type";
                  "Account No":=PV."Account No."
                END;
                VALIDATE("Account No");
                */

            end;
        }
        field(6;Amount;Decimal)
        {

            trigger OnValidate()
            begin
                Validate("Applies to Doc. No");
                CSetup.Get;
                CSetup.TestField("Rounding Precision");
                if CSetup."Rounding Type"=CSetup."rounding type"::Up then
                   Direction:='>'
                 else if CSetup."Rounding Type"=CSetup."rounding type"::Nearest then
                   Direction:='='
                 else if CSetup."Rounding Type"=CSetup."rounding type"::Down then
                   Direction:='<';
                case "Account Type" of
                "account type"::"G/L Account":
                 begin
                 //Check for Retention
                 if "Retention Code"<>'' then begin
                  if GLAccount.Get("Account No") then
                   if VATSetup.Get(GLAccount."VAT Bus. Posting Group","Retention Code") then begin
                     if VATSetup."VAT %"<>0 then begin
                         RetAmount:=ROUND((Amount/(1+VATSetup."VAT %"/100)*VATSetup."VAT %"/100),CSetup."Rounding Precision",Direction);
                         NetAmount:=Amount-RetAmount;
                         "Retention Amount":=RetAmount;
                     end;
                    end;
                   end;
                 //End of Retention
                  if "VAT Code"<>'' then begin
                    if GLAccount.Get("Account No") then
                      if VATSetup.Get(GLAccount."VAT Bus. Posting Group","VAT Code") then begin
                        if VATSetup."VAT %"<>0 then begin
                           VATAmount:=ROUND((Amount/(1+VATSetup."VAT %"/100)*VATSetup."VAT %"/100),CSetup."Rounding Precision",Direction);
                           NetAmount:=Amount-VATAmount;
                           "VAT Amount":=VATAmount;
                           if CSetup."Post VAT" then//Check IF VAT is to be posted
                           "Net Amount":=Amount-VATAmount
                           else
                           "Net Amount":=Amount;
                          if "W/Tax Code"<>'' then begin
                           if GLAccount.Get("Account No") then
                            if VATSetup.Get(GLAccount."Gen. Bus. Posting Group","W/Tax Code") then begin
                               "W/TAmount":=ROUND(NetAmount*VATSetup."VAT %"/100,CSetup."Rounding Precision",Direction);
                                "W/Tax Amount":="W/TAmount";
                                NetAmount:=NetAmount-"W/TAmount";
                                if CSetup."Post VAT" then//Check IF VAT is to be posted
                                "Net Amount":=NetAmount
                                else
                                "Net Amount":=Amount-"W/TAmount";
                             end;
                           end;
                         end else begin
                          "Net Amount":=Amount;
                           NetAmount:=Amount;
                          if "W/Tax Code"<>'' then begin
                           if GLAccount.Get("Account No") then
                            if VATSetup.Get(GLAccount."Gen. Bus. Posting Group","W/Tax Code") then begin
                               "W/TAmount":=ROUND(NetAmount*VATSetup."VAT %"/100,CSetup."Rounding Precision",Direction);
                                "W/Tax Amount":="W/TAmount";
                                NetAmount:=NetAmount-"W/TAmount";
                              "Net Amount":=Amount-"W/TAmount";
                             end;
                           end;
                         end;
                       end;
                    end
                  else begin
                  "Net Amount":=Amount;
                  NetAmount:=Amount;
                   if "W/Tax Code"<>'' then begin
                     if GLAccount.Get("Account No") then
                      if VATSetup.Get(GLAccount."Gen. Bus. Posting Group","W/Tax Code") then begin
                          "W/TAmount":=ROUND(NetAmount*VATSetup."VAT %"/100,CSetup."Rounding Precision",Direction);
                          "W/Tax Amount":="W/TAmount";
                           NetAmount:=NetAmount-"W/TAmount";
                          "Net Amount":=Amount-"W/TAmount";
                      end;
                    end;
                    //Payee calculation
                         //"Net Amount":=Amount;
                           NetAmount:=Amount;
                          if "Payee Code"<>'' then begin
                           if GLAccount.Get("Account No") then
                            if VATSetup.Get(GLAccount."Gen. Bus. Posting Group","Payee Code") then begin
                              "Payee Amount":=ROUND(NetAmount*VATSetup."VAT %"/100,0.1,Direction);
                               "Payee Amount":="Payee Amount";
                                NetAmount:=NetAmount-"Payee Amount";
                              "Net Amount":=Amount-"Payee Amount";

                  end;
                end;
                end;
                end;
                 "account type"::Customer:
                 begin
                 //Check for Retention
                 if "Retention Code"<>'' then begin
                  if Customer.Get("Account No") then
                   if VATSetup.Get(Customer."VAT Bus. Posting Group","Retention Code") then begin
                     if VATSetup."VAT %"<>0 then begin
                         RetAmount:=ROUND((Amount/(1+VATSetup."VAT %"/100)*VATSetup."VAT %"/100),CSetup."Rounding Precision",Direction);
                         NetAmount:=Amount-RetAmount;
                         "Retention Amount":=RetAmount;
                     end;
                    end;
                   end;
                 //End of Retention
                  if "VAT Code"<>'' then begin
                    if Customer.Get("Account No") then
                      if VATSetup.Get(Customer."VAT Bus. Posting Group","VAT Code") then begin
                         VATAmount:=ROUND((Amount/(1+VATSetup."VAT %"/100)*VATSetup."VAT %"/100),CSetup."Rounding Precision",Direction);
                        if VATSetup."VAT %"<>0 then begin
                           NetAmount:=Amount-VATAmount;
                           "VAT Amount":=VATAmount;
                           if CSetup."Post VAT" then//Check IF VAT is to be posted
                              "Net Amount":=Amount-VATAmount
                              else
                              "Net Amount":=Amount;
                          if "W/Tax Code"<>'' then begin
                           if Customer.Get("Account No") then
                            if VATSetup.Get(Customer."VAT Bus. Posting Group","W/Tax Code") then begin
                               "W/TAmount":=ROUND(NetAmount*VATSetup."VAT %"/100,CSetup."Rounding Precision",Direction);
                                "W/Tax Amount":="W/TAmount";
                                NetAmount:=NetAmount-"W/TAmount";
                             if CSetup."Post VAT" then//Check IF VAT is to be posted
                                "Net Amount":=NetAmount
                                else
                                "Net Amount":=Amount-"W/TAmount";
                             end;
                           end;
                         end else begin
                           "Net Amount":=Amount;
                           NetAmount:=Amount;
                          if "W/Tax Code"<>'' then begin
                           if Customer.Get("Account No") then
                            if VATSetup.Get(Customer."VAT Bus. Posting Group","W/Tax Code") then begin
                               "W/TAmount":=ROUND(NetAmount*VATSetup."VAT %"/100,CSetup."Rounding Precision",Direction);
                                "W/Tax Amount":="W/TAmount";
                                NetAmount:=NetAmount-"W/TAmount";
                              "Net Amount":=Amount-"W/TAmount";
                             end;
                           end;
                         end;
                       end;
                    end
                  else begin
                  "Net Amount":=Amount;
                  NetAmount:=Amount;
                   if "W/Tax Code"<>'' then begin
                     if Customer.Get("Account No") then
                      if VATSetup.Get(Customer."VAT Bus. Posting Group","W/Tax Code") then begin
                          "W/TAmount":=ROUND(NetAmount*VATSetup."VAT %"/100,CSetup."Rounding Precision",Direction);
                          "W/Tax Amount":="W/TAmount";
                           NetAmount:=NetAmount-"W/TAmount";
                          "Net Amount":=Amount-"W/TAmount";
                      end;
                    end;
                  end;
                end;
                 "account type"::Vendor:
                 begin
                 //Check for Retention
                 if "Retention Code"<>'' then begin
                  if Vendor.Get("Account No") then
                   if VATSetup.Get(Vendor."VAT Bus. Posting Group","Retention Code") then begin
                     if VATSetup."VAT %"<>0 then begin
                         RetAmount:=ROUND((Amount/(1+VATSetup."VAT %"/100)*VATSetup."VAT %"/100),CSetup."Rounding Precision",Direction);
                         NetAmount:=Amount-RetAmount;
                         "Retention Amount":=RetAmount;

                     end;
                    end;
                   end;
                 //End of Retention
                  if "VAT Code"<>'' then begin
                    if Vendor.Get("Account No") then
                      if VATSetup.Get(Vendor."VAT Bus. Posting Group","VAT Code") then begin
                        if VATSetup."VAT %"<>0 then begin
                           VATAmount:=ROUND((Amount/(1+VATSetup."VAT %"/100)*VATSetup."VAT %"/100),CSetup."Rounding Precision",Direction);
                           NetAmount:=Amount-VATAmount;
                           "VAT Amount":=VATAmount;
                           if CSetup."Post VAT" then//Check IF VAT is to be posted
                           "Net Amount":=Amount-VATAmount
                           else
                           "Net Amount":=Amount;
                          if "W/Tax Code"<>'' then begin
                           if Vendor.Get("Account No") then
                            if VATSetup.Get(Vendor."VAT Bus. Posting Group","W/Tax Code") then begin

                               "W/TAmount":=ROUND(NetAmount*VATSetup."VAT %"/100,CSetup."Rounding Precision",Direction);
                                "W/Tax Amount":="W/TAmount";
                                NetAmount:=NetAmount-"W/TAmount";
                              if CSetup."Post VAT" then//Check IF VAT is to be posted
                                "Net Amount":=NetAmount
                                else
                                "Net Amount":=Amount-"W/TAmount";
                             end;
                           end;
                         end else begin
                         "Net Amount":=Amount;
                           NetAmount:=Amount;
                          if "W/Tax Code"<>'' then begin
                           if Vendor.Get("Account No") then
                            if VATSetup.Get(Vendor."VAT Bus. Posting Group","W/Tax Code") then begin
                               "W/TAmount":=ROUND(NetAmount*VATSetup."VAT %"/100,CSetup."Rounding Precision",Direction);
                               Message('W/tAMOUNT');
                                "W/Tax Amount":="W/TAmount";
                                NetAmount:=NetAmount-"W/TAmount";
                              "Net Amount":=Amount-"W/TAmount";
                             end;
                           end;
                         end;
                       end;
                    end
                  else begin
                  "Net Amount":=Amount;
                  NetAmount:=Amount;
                   if "W/Tax Code"<>'' then begin
                     if Vendor.Get("Account No") then
                      if VATSetup.Get(Vendor."VAT Bus. Posting Group","W/Tax Code") then begin
                          "W/TAmount":=ROUND(NetAmount*VATSetup."VAT %"/100,CSetup."Rounding Precision",Direction);
                          "W/Tax Amount":="W/TAmount";
                           NetAmount:=NetAmount-"W/TAmount";
                          "Net Amount":=Amount-"W/TAmount";
                      end;
                    end;
                  end;
                 end;
                "account type"::"Bank Account":
                begin
                 "Net Amount":=Amount;
                 end;
                end;
            end;
        }
        field(7;Grouping;Code[10])
        {
        }
        field(8;"Shortcut Dimension 1 Code";Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(1),
                                                          Blocked=const(false));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1,"Shortcut Dimension 1 Code");
            end;
        }
        field(9;"Shortcut Dimension 2 Code";Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(2));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(2,"Shortcut Dimension 2 Code");
            end;
        }
        field(10;"Line No";Integer)
        {
        }
        field(11;"Applies to Doc. No";Code[20])
        {
            Caption = 'Applies-to Doc. No.';

            trigger OnLookup()
            var
                GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line";
                PaymentToleranceMgt: Codeunit "Payment Tolerance Management";
            begin

                "Applies to Doc. No":='';
                Amt:=0;
                  VATAmount:=0;
                 "W/TAmount":=0;

                case "Account Type" of
                "account type"::Customer:
                begin
                 CustLedger.Reset;
                 CustLedger.SetCurrentkey(CustLedger."Customer No.",Open,"Document No.");
                 CustLedger.SetRange(CustLedger."Customer No.","Account No");
                 CustLedger.SetRange(Open,true);
                 CustLedger.CalcFields(CustLedger.Amount);
                if Page.RunModal(0,CustLedger) = Action::LookupOK then begin

                if CustLedger."Applies-to ID"<>'' then begin
                 CustLedger1.Reset;
                 CustLedger1.SetCurrentkey(CustLedger1."Customer No.",Open,"Applies-to ID");
                 CustLedger1.SetRange(CustLedger1."Customer No.","Account No");
                 CustLedger1.SetRange(Open,true);
                 CustLedger1.SetRange("Applies-to ID",CustLedger."Applies-to ID");
                 if CustLedger1.Find('-') then begin
                   repeat
                     CustLedger1.CalcFields(CustLedger1."Remaining Amount");
                     Amt:=Amt+Abs(CustLedger1."Remaining Amount");
                   until CustLedger1.Next=0;
                  end;

                if Amt<>Amt then
                 //ERROR('Amount is not equal to the amount applied on the application form');
                 if Amount=0 then
                 Amount:=Amt;
                 Validate(Amount);
                 "Applies to Doc. No":=CustLedger."Document No.";
                end else begin
                if Amount<>Abs(CustLedger.Amount) then
                CustLedger.CalcFields(CustLedger."Remaining Amount");
                 if Amount=0 then
                Amount:=Abs(CustLedger."Remaining Amount");
                Validate(Amount);
                "Applies to Doc. No":=CustLedger."Document No.";
                end;
                end;
                Validate(Amount);
                end;

                "account type"::Vendor:
                begin
                 VendLedger.Reset;
                 VendLedger.SetCurrentkey(VendLedger."Vendor No.",Open,"Document No.");
                 VendLedger.SetRange(VendLedger."Vendor No.","Account No");
                 VendLedger.SetRange(Open,true);
                 VendLedger.CalcFields("Remaining Amount");
                if Page.RunModal(0,VendLedger) = Action::LookupOK then begin

                if VendLedger."Applies-to ID"<>'' then begin
                 VendLedger1.Reset;
                 VendLedger1.SetCurrentkey(VendLedger1."Vendor No.",Open,"Applies-to ID");
                 VendLedger1.SetRange(VendLedger1."Vendor No.","Account No");
                 VendLedger1.SetRange(Open,true);
                 VendLedger1.SetRange(VendLedger1."Applies-to ID",VendLedger."Applies-to ID");
                 if VendLedger1.Find('-') then begin
                   repeat
                     VendLedger1.CalcFields(VendLedger1."Remaining Amount");

                     NetAmount:=NetAmount+Abs(VendLedger1."Remaining Amount");

                   until VendLedger1.Next=0;
                  end;

                if NetAmount<>NetAmount then
                 //ERROR('Amount is not equal to the amount applied on the application form');
                  if Amount=0 then
                 Amount:=NetAmount;

                 Validate(Amount);
                 "Applies to Doc. No":=VendLedger."Document No.";
                end else begin
                if Amount<>Abs(VendLedger."Remaining Amount") then
                VendLedger.CalcFields(VendLedger."Remaining Amount");
                 if Amount=0 then
                Amount:=Abs(VendLedger."Remaining Amount");
                Validate(Amount);
                "Applies to Doc. No":=VendLedger."Document No.";
                end;
                end;
                Amount:=Abs(VendLedger."Remaining Amount");
                Validate(Amount);
                end;
                end;
            end;

            trigger OnValidate()
            var
                CustLedgEntry: Record "Cust. Ledger Entry";
                VendLedgEntry: Record "Vendor Ledger Entry";
                TempGenJnlLine: Record "Gen. Journal Line" temporary;
            begin
                //VALIDATE(Description);
                case "Account Type" of
                 "account type"::Customer:
                  begin
                    CustLedger.Reset;
                    CustLedger.SetRange("Customer No.","Account No");
                    CustLedger.SetRange(Open,true);
                    CustLedger.SetRange("Document No.","Applies to Doc. No");
                     if CustLedger.Find('-') then
                       begin
                       "Applies-to Doc. Type":=CustLedger."Document Type";
                       //Added to Autopopulate the Invoice Description
                        Description:=VendLedger.Description;
                       end;

                  end;
                 "account type"::Vendor:
                  begin
                    VendLedger.Reset;
                    VendLedger.SetRange("Vendor No.","Account No");
                    VendLedger.SetRange(Open,true);
                    VendLedger.SetRange("Document No.","Applies to Doc. No");
                     if VendLedger.Find('-') then
                       begin
                      "Applies-to Doc. Type":=VendLedger."Document Type";
                     //Added to Autopopulate the Invoice Description
                        Description:=VendLedger.Description;
                       end;

                  end;
                end;
            end;
        }
        field(12;"Claim No";Code[20])
        {
        }
        field(13;"Benefit ID";Code[20])
        {
        }
        field(14;"Claimant ID";Integer)
        {
        }
        field(15;"Policy No";Code[20])
        {
        }
        field(16;"Amt Premium Currency";Decimal)
        {
        }
        field(17;"Amt Reporting Currency";Decimal)
        {
        }
        field(18;Underwriter;Code[20])
        {
            TableRelation = Vendor where ("Vendor Type"=const(Law));
        }
        field(19;"Policy Type";Code[20])
        {
        }
        field(20;"Claim Line Line No";Integer)
        {
        }
        field(21;"Patients Name";Text[250])
        {
        }
        field(22;Insured;Text[30])
        {
        }
        field(23;"Client Type";Text[30])
        {
        }
        field(24;"Plan Type";Text[130])
        {
        }
        field(25;Provider;Text[130])
        {
        }
        field(26;Payee;Text[130])
        {
        }
        field(27;"Date of Service";Date)
        {
        }
        field(28;Diagnosis;Text[250])
        {
        }
        field(29;"ICD10 Code";Code[10])
        {
        }
        field(30;"Notification date";Date)
        {
        }
        field(31;"Date settled";Date)
        {
        }
        field(32;"External Reference";Code[20])
        {
        }
        field(33;YOA;Code[10])
        {
        }
        field(34;ChequeNo;Code[20])
        {
        }
        field(35;"Pay member";Decimal)
        {
        }
        field(36;"Pay Provider";Decimal)
        {
        }
        field(37;"Denial Reason Code";Code[10])
        {
        }
        field(38;"Denial Statement";Text[150])
        {
            FieldClass = Normal;
        }
        field(39;"Payment Frequency";Code[20])
        {
        }
        field(40;"Premium Due Date";Date)
        {
        }
        field(41;Tax;Boolean)
        {
        }
        field(42;"Bal. Account Type";Option)
        {
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner";
        }
        field(43;"Bal. Account No.";Code[30])
        {
        }
        field(44;"KBA Branch Code";Code[20])
        {
            TableRelation = "Employee Bank AccountX1".Code;
        }
        field(45;"Bank Account No";Code[250])
        {
        }
        field(46;"W/Tax Code";Code[20])
        {
            TableRelation = "VAT Product Posting Group";

            trigger OnValidate()
            begin
                Validate(Amount);
            end;
        }
        field(47;"VAT Amount";Decimal)
        {
        }
        field(48;"W/Tax Amount";Decimal)
        {
        }
        field(49;"Net Amount";Decimal)
        {
        }
        field(50;"Loan No";Code[20])
        {
        }
        field(51;"Asset No";Code[20])
        {
            TableRelation = "Fixed Asset";
        }
        field(52;"Amount(LCY)";Decimal)
        {
        }
        field(53;"VAT Code";Code[20])
        {
            TableRelation = "VAT Product Posting Group";

            trigger OnValidate()
            begin
                Validate(Amount);
            end;
        }
        field(54;"Applies-to Doc. Type";Option)
        {
            Caption = 'Applies-to Doc. Type';
            OptionCaption = ' ,Payment,Invoice,Credit Memo,Finance Charge Memo,Reminder,Refund';
            OptionMembers = " ",Payment,Invoice,"Credit Memo","Finance Charge Memo",Reminder,Refund;
        }
        field(55;"Retention Code";Code[20])
        {
            TableRelation = "VAT Product Posting Group";
        }
        field(56;"Retention Amount";Decimal)
        {
        }
        field(57;"Dimension Set ID";Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";

            trigger OnLookup()
            begin
                ShowDimensions;
            end;
        }
        field(58;"Payee Code";Code[10])
        {
            TableRelation = "VAT Product Posting Group";

            trigger OnValidate()
            begin
                  Validate(Amount);
            end;
        }
        field(59;"Payee Amount";Decimal)
        {
        }
    }

    keys
    {
        key(Key1;"PV No","Line No")
        {
            Clustered = true;
            SumIndexFields = Amount,"Net Amount";
        }
        key(Key2;Tax)
        {
            SumIndexFields = Amount,"Net Amount";
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin

        if Payments.Get("PV No") then
        if Payments.Posted then
        Error ('You cannot delete the lines at this stage');

        if Payments.Status<>Payments.Status::Open then
        Error('You cannot delete the line at this stage');
    end;

    trigger OnInsert()
    begin
        if Payments.Get("PV No") then

        if Payments.Status<>Payments.Status::Open then
        Error('You cannot insert the line at this stage');
    end;

    trigger OnModify()
    begin
        if Payments.Get("PV No") then
        if Payments.Posted then
        Error ('You cannot delete the lines at this stage');

          if Payments.Status<>Payments.Status::Open then
        Error('You cannot modify the line at this stage');
    end;

    var
        RecPayTypes: Record "Receipts and Payment Types1";
        GLAcc: Record "G/L Account";
        Cust: Record Customer;
        Vend: Record Vendor;
        FA: Record "Fixed Asset";
        BankAcc: Record "Bank Account";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        GenLedgerSetup: Record "General Ledger Setup";
        CurrExchRate: Record "Currency Exchange Rate";
        Payments: Record Payments;
        PaymentToleranceMgt: Codeunit "Payment Tolerance Management";
        PV: Record Payments;
        CurrencyExchange: Record "Currency Exchange Rate";
        SalesInvoiceHeadr: Record "Sales Cr.Memo Header";
        AccNo: Code[20];
        AccType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner";
        CustLedgEntry: Record "Cust. Ledger Entry";
        VendLedgEntry: Record "Vendor Ledger Entry";
        PurchInv: Record "Purch. Inv. Header";
        TariffCodes: Record "Tarriff Codes1";
        Amt: Decimal;
        Direction: Text[30];
        VATAmount: Decimal;
        "W/TAmount": Decimal;
        RetAmount: Decimal;
        NetAmount: Decimal;
        VATSetup: Record "VAT Posting Setup";
        CustLedger: Record "Cust. Ledger Entry";
        CustLedger1: Record "Cust. Ledger Entry";
        VendLedger: Record "Vendor Ledger Entry";
        VendLedger1: Record "Vendor Ledger Entry";
        GLAccount: Record "G/L Account";
        Customer: Record Customer;
        Vendor: Record Vendor;
        Bank: Record "Bank Account";
        FixedAsset: Record "Fixed Asset";
        CSetup: Record "Cash Management Setup1";
        DimMgt: Codeunit DimensionManagement;


    procedure ValidateShortcutDimCode(FieldNumber: Integer;var ShortcutDimCode: Code[20])
    begin
        DimMgt.ValidateShortcutDimValues(FieldNumber,ShortcutDimCode,"Dimension Set ID");
    end;


    procedure LookupShortcutDimCode(FieldNumber: Integer;var ShortcutDimCode: Code[20])
    begin
        DimMgt.LookupDimValueCode(FieldNumber,ShortcutDimCode);
        DimMgt.ValidateShortcutDimValues(FieldNumber,ShortcutDimCode,"Dimension Set ID");
    end;


    procedure ShowDimensions()
    begin

        // "Dimension Set ID" :=
        //   DimMgt.EditDimensionSet2(
        //     "Dimension Set ID",StrSubstNo('%1 %2',"PV No","Line No"),
        //     "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
    end;


    procedure ShowShortcutDimCode(var ShortcutDimCode: array [8] of Code[20])
    begin
        DimMgt.GetShortcutDimensions("Dimension Set ID",ShortcutDimCode);
    end;
}

