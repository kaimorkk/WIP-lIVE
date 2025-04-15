Table 52193452 "Monthly Contributions"
{
    DrillDownPageID = "Monthly Contributions";
    LookupPageID = "Monthly Contributions";

    fields
    {
        field(1; "Member No."; Code[30])
        {
            // TableRelation = Customer."No." where ("Customer Type"=filter(Member));

            trigger OnValidate()
            begin
                // if Cust.Get("Member No.") then begin
                // "Member Name":=Cust.Name;
                // "Global Dimension 1 Code":=Cust."Global Dimension 1 Code";
                // "Created Date":=Today;
                // end;
            end;
        }
        field(2; "Global Dimension 1 Code"; Code[30])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(3; "Global Dimension 2 Code"; Code[30])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(4; Amount; Decimal)
        {
            CalcFormula = - sum("Detailed Cust. Ledg. Entry".Amount where("Customer No." = field("Member No."),
                                                                          "Initial Entry Global Dim. 2" = field("Global Dimension 2 Code"),
                                                                          "Posting Date" = field("Date Filter")));
            FieldClass = FlowField;
        }
        field(5; "Interest Amount"; Decimal)
        {
        }
        field(6; "Tax Charged"; Decimal)
        {
        }
        field(7; "Transaction Type"; Option)
        {
            OptionCaption = ' ,Registration Fee,Deposit Contribution,Share Contribution,Loan,Loan Repayment,Withdrawal,Interest Due,Interest Paid,Investment,Dividend Paid,Processing Fee,Withholding Tax,BBF Contribution';
            OptionMembers = " ","Registration Fee","Deposit Contribution","Share Contribution",Loan,"Loan Repayment",Withdrawal,"Interest Due","Interest Paid",Investment,"Dividend Paid","Processing Fee","Withholding Tax","BBF Contribution";

            trigger OnValidate()
            begin
                //GenSetup.GET;
            end;
        }
        field(8; "Posting Group"; Code[30])
        {
        }
        field(9; "Date Filter"; Date)
        {
            Caption = 'Date Filter';
            FieldClass = FlowFilter;
        }
        field(10; "Member Name"; Text[50])
        {
        }
        field(11; "Created Date"; Date)
        {
        }
        field(12; "Created By"; Code[100])
        {
        }
        field(13; Status; Option)
        {
            Editable = false;
            OptionCaption = 'Open,Pending Approval,Released,Canceled,Rejected';
            OptionMembers = Open,"Pending Approval",Released,Canceled,Rejected;
        }
        field(14; "Product Code"; Code[20])
        {
            TableRelation = "Bosa Products";

            trigger OnValidate()
            begin
                if BosaProd.Get("Product Code") then begin
                    "Global Dimension 2 Code" := BosaProd."Global Dimension 2 Code";
                    Validate("Global Dimension 2 Code");
                end;
            end;
        }
        field(15; "Expected Contribution"; Decimal)
        {
        }
        field(16; "Share Capital"; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Member No.", "Product Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        "Created By" := UserId;
    end;

    var
        Cust: Record Customer;
        BosaProd: Record "Bosa Products";
}

