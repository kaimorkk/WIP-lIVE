Page 52193981 "Balance form"
{
    PageType = Card;
    SourceTable = "Balance adjustments1";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(UserID;"User ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Style = Strong;
                    StyleExpr = true;
                }
                field(PayrollDate;"Payroll Date")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field(EmployeeNumber;"Employee Number")
                {
                    ApplicationArea = Basic;
                    Editable = true;

                    trigger OnValidate()
                    begin
                                if emp."No."="Employee Number" then
                                "User ID":=emp."First Name"+' '+emp."Middle Name"+' '+emp."Last Name";
                    end;
                }
                field(Names;Names)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(Amount;Amount)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field(SourceDocNo;"Source Doc.No.")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
                  CurrPage.Editable:=true;
    end;

    trigger OnOpenPage()
    begin
              CurrPage.Editable:=false;
    end;

    var
        emp: Record Employee;
        names: Text[100];
        bal: Record balcalc1;
}

