Page 52193937 "Commissioner Card"
{
    PageType = Card;
    SourceTable = "Dimension Value";
    SourceTableView = where("Global Dimension No."=const(2));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field(Name;Name)
                {
                    ApplicationArea = Basic;
                }
                field(Email;Email)
                {
                    ApplicationArea = Basic;
                }
                field(CommissionersBalance;"Commissioners Balance")
                {
                    ApplicationArea = Basic;
                }
                field(BankAccountNumber;"Bank Account Number")
                {
                    ApplicationArea = Basic;
                }
                field(BankBranch;"Bank Branch")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Commissioner)
            {
                Caption = 'Commissioner';
                action(EDSetup)
                {
                    ApplicationArea = Basic;
                    Caption = 'ED Setup';
                    RunObject = Page "Commissioner ED Setup";
                    RunPageLink = Commissioner=field(Code);
                }
                action(Allowances)
                {
                    ApplicationArea = Basic;
                    Caption = 'Allowances';
                    RunObject = Page "Commissioner Transactions";
                    RunPageLink = Commissioner=field(Code);
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
          "Global Dimension No.":=2;
          if GLSetup.Get then
          "Dimension Code":=GLSetup."Global Dimension 2 Code";
    end;

    var
        GLSetup: Record "General Ledger Setup";
}

