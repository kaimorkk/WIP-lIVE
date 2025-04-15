Table 52193591 Payments1
{

    fields
    {
        field(1; No; Code[20])
        {
        }
        field(2; "Account No."; Code[20])
        {
            TableRelation = if ("Account Type" = const("G/L Account")) "G/L Account"
            else if ("Account Type" = const(Customer)) Customer;

            trigger OnValidate()
            begin

                /*IF "Account Type"="Account Type"::Customer THEN BEGIN
               cust.RESET;
               cust.SETRANGE(cust."No.","Account No.");
               IF cust.FIND('-') THEN BEGIN
               "Member name":=cust.Name;

               END;
               END;*/

                /*IF "Account Type"="Account Type"::"G/L Account" THEN BEGIN
                "GL Account".RESET;
                "GL Account".SETRANGE("GL Account"."No.","Account No.");
                IF "GL Account".FIND('-') THEN BEGIN
                "Member name":="GL Account".Name;
                END;
                END;*/

            end;
        }
        field(3; "Payment Date"; Date)
        {
        }
        field(4; Amount; Decimal)
        {
            CalcFormula = sum("Payment Lines".Amount where(No = field(No)));
            FieldClass = FlowField;
        }
        field(5; "No. Series"; Code[20])
        {
        }
        field(6; Cashier; Code[80])
        {
        }
        field(7; "Bank Account"; Code[20])
        {
            // TableRelation = "Bank Account"."No." where(Type = filter(Bank | "Petty Cash"),
            //                                             "Account Type" = filter(" "));
        }
        field(8; "Ext. Document No."; Code[20])
        {
        }
        field(9; Posted; Boolean)
        {
            Editable = false;
        }
        field(10; "Payment Mode"; Code[20])
        {
            TableRelation = "Payment Modes".Code;
        }
        field(11; "Member Name"; Text[60])
        {
        }
        field(12; "Cheque No."; Code[20])
        {

            trigger OnValidate()
            begin
                /*IF ("cashier receipt"."Receipt Mode"="cashier receipt"."Receipt Mode"::"1") THEN
                
                //IF ("cashier receipt"."CHEQUE NO"=0) THEN
                
                  ERROR('YOU MUST FILL CHEQUE NUMBER');
                                                        */

            end;
        }
        field(13; "Account Type"; Option)
        {
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,IC Partner';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner";
        }
        field(14; "Account Name"; Code[20])
        {
        }
        field(15; "Amount Paid"; Decimal)
        {
        }
        field(16; "Cheque No"; Code[20])
        {
        }
        field(17; "Cheque Date"; Date)
        {
        }
        field(18; "Posted By"; Code[80])
        {
        }
        field(19; "Posted Date"; Date)
        {
        }
        field(20; "Time Posted"; Time)
        {
        }
        field(24; "Activity Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(1,"Shortcut Dimension 1 Code");
            end;
        }
        field(25; Status; Option)
        {
            OptionCaption = 'Open,Released,Pending Approval,Pending Prepayment,Reversed,Rejected';
            OptionMembers = Open,Released,"Pending Approval","Pending Prepayment",Reversed,Rejected;
        }
        field(26; Remarks; Text[100])
        {
        }
        field(27; "Payment Types"; Code[20])
        {
            TableRelation = "Receipts and Payments Types".Code;

            trigger OnValidate()
            begin
                /*// Getting the Default Account Type and Account No From the Receipts and Payment Type Table
                IF Payment.GET("Payment Types") THEN BEGIN
                  "Account Type" := Payment.Description;
                  "Account No." :=  Payment."Transaction Type";
                   Description := Payment.Description;
                END;
                */

            end;
        }
        field(28; "Employer Code"; Code[20])
        {
            // TableRelation = "Bank Account"."No." where(Status = filter(Released),
            //                                             Type = filter(Bank),
            //                                             "Account Type" = const(Employer));

            trigger OnValidate()
            begin
                // if Employer.Get("Employer Code") then
                //     "Employer Name" := Employer.Name;
            end;
        }
        field(29; "Employer Name"; Code[40])
        {
        }
        field(30; "Payment To"; Text[100])
        {
        }
        field(31; Description; Text[100])
        {
        }
        field(32; "Applies- To Doc No."; Code[20])
        {

            trigger OnLookup()
            begin

                /*CASE "Account Type" OF
                  "Account Type"::Customer:
                
                   BEGIN
                        CustLedger.RESET;
                        CustLedger.SETCURRENTKEY(CustLedger."Customer No.",Open,"Document No.");
                        CustLedger.SETRANGE(CustLedger."Customer No.","Account No.");
                        CustLedger.SETRANGE(Open,TRUE);
                        CustLedger.CALCFIELDS(CustLedger.Amount);
                       IF FORM.RUNMODAL(25,CustLedger) = ACTION::LookupOK THEN BEGIN
                
                        "Applies- To Doc No.":=CustLedger."Document No.";
                
                       END;
                
                      END;
                   END; */

            end;
        }
        field(33; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(34; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(35; "Currency Code"; Code[30])
        {
            TableRelation = Currency.Code;
        }
        field(36; "Original Document"; Option)
        {
            OptionCaption = ',Imprest,Staff Claim';
            OptionMembers = ,Imprest,"Staff Claim";
        }
        field(37; Type; Option)
        {
            OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,None,MemberApplication,Contributions,LoanApplication,TopUpForm,EmployerForm,FosaAccountApplication,Standing Orders,Cheque Requisition,Teller Request,Imprest Requisitioning,Imprest,Imprest Surrender,Purchase Requisition,Store Requisition,Payment Voucher,Staff Claim,Petty Cash';
            OptionMembers = Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None",MemberApplication,Contributions,LoanApplication,TopUpForm,EmployerForm,FosaAccountApplication,"Standing Orders","Cheque Requisition","Teller Request","Imprest Requisitioning",Imprest,"Imprest Surrender","Purchase Requisition","Store Requisition","Payment Voucher","Staff Claim","Petty Cash";
        }
    }

    keys
    {
        key(Key1; No)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        if Posted then
            Error('You cannot delete the details of the payment voucher at this stage');
    end;

    trigger OnInsert()
    begin
        if No = '' then begin
            // BosaSetup.Get;
            // BosaSetup.TestField(BosaSetup."PV Nos");
            // NoSeriesMgt.InitSeries(BosaSetup."PV Nos", xRec."No. Series", 0D, No, "No. Series");
        end;
        ///"Payment Date":=TODAY;
        Cashier := UserId;
        //"Creation Date":=TODAY;
    end;

    trigger OnModify()
    begin
        /*IF Posted THEN
        ERROR('You cannot delete the details of the payment voucher at this stage');*/

    end;

    var
        BosaSetup: Record "Bosa Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        cust: Record Customer;
        "cashier receipt": Record Receipts;
        "GL Account": Record "G/L Account";
        cashrec: Record "Receipts Lines";
        cashierr: Record "Receipts Lines";
        Payment: Record "Receipts and Payments Types";
    // Employer: Record Employer;
}

