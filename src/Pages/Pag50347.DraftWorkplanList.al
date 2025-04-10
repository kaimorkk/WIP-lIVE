page 50347 "Draft Workplan List"
{
    Caption = 'Draft Workplan List';
    ApplicationArea = All;
    CardPageID = "Draft Workplan Card";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "Annual Strategy Workplan";
    UsageCategory = Lists;
    SourceTableView = where("Planning Budget Type" = filter(Supplementary | "Supplementary 2"));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; No)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("Strategy Plan ID"; "Strategy Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Year Reporting Code"; "Year Reporting Code")
                {
                    ApplicationArea = Basic;
                }
                field("Start Date"; "Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("End Date"; "End Date")
                {
                    ApplicationArea = Basic;
                }

            }
        }
    }
    actions
    {
    }
    trigger OnOpenPage()
    begin
        if UserSetup.Get(UserId) then begin
            if Employee.Get(UserSetup."Employee No.") then begin
                rec.SetFilter("Global Dimension 2 Code", Employee."Global Dimension 2 Code");
            end;
        end;
    end;

    var
        UserSetup: Record "User Setup";
        Employee: Record Employee;
}
