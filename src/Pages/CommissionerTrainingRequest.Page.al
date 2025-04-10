Page 52194167 "Commissioner Training Request"
{
    Editable = true;
    PageType = List;
    SourceTable = "Training Request1";
    SourceTableView = where(Commissioner=const(true));

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(RequestNo;"Request No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(RequestDate;"Request Date")
                {
                    ApplicationArea = Basic;
                }
                field(CommisionerNo;"Commisioner No")
                {
                    ApplicationArea = Basic;
                }
                field(CommissionerName;"Commissioner Name")
                {
                    ApplicationArea = Basic;
                }
                field(DepartmentCode;"Department Code")
                {
                    ApplicationArea = Basic;
                }
                field(Designation;Designation)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                    Caption = 'Course';
                }
                field(From;"Planned Start Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'From';
                }
                field("To";"Planned End Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'To';
                }
                field(NoOfDays;"No. Of Days")
                {
                    ApplicationArea = Basic;
                }
                field(TrainingInsitution;"Training Insitution")
                {
                    ApplicationArea = Basic;
                }
                field(Venue;Venue)
                {
                    ApplicationArea = Basic;
                }
                field(TuitionFee;"Tuition Fee")
                {
                    ApplicationArea = Basic;
                }
                field(PerDiem;"Per Diem")
                {
                    ApplicationArea = Basic;
                }
                field(AirTicket;"Air Ticket")
                {
                    ApplicationArea = Basic;
                }
                field(TotalCost;"Total Cost")
                {
                    ApplicationArea = Basic;
                }
                field(Currency;Currency)
                {
                    ApplicationArea = Basic;
                }
                field(ExchangeRate;"Exchange Rate")
                {
                    ApplicationArea = Basic;
                }
                field(TotalCostKES;"Total Cost (LCY)")
                {
                    ApplicationArea = Basic;
                    Caption = 'Total Cost (KES)';
                }
                field(AvailableFunds;"Available Funds")
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
          Commissioner:=true;
    end;

    trigger OnOpenPage()
    begin
        if UserRec.Get(UserId) then
        if Emp.Get(UserRec."Employee No.") then
        SetRange("Department Code",Emp."Global Dimension 1 Code");
    end;

    var
        UserRec: Record "User Setup";
        Emp: Record Employee;
}

