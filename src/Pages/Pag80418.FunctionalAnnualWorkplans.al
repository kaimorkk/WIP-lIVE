Page 80418 "Functional Annual Workplans"
{
    ApplicationArea = Basic;
    Caption = 'Resource Requirements';
    CardPageID = "Functional AWP Card";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "Annual Strategy Workplan";
    UsageCategory = Lists;
    SourceTableView = where("Planning Budget Type" = const(Original));

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

                field("Year Reporting Code"; "Year Reporting Code")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 1 Code"; "Global Dimension 1 Code")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Global Dimension 2 Code"; "Global Dimension 2 Code")
                {
                    ApplicationArea = Basic, Suite;
                }
                field(Quarter1Amount; QuarterAmount[1])
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Quarter 1 Amount';
                    Editable = false;
                    Drilldown = true;
                }
                field(Quarter2Amount; QuarterAmount[2])
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Quarter 2 Amount';
                    Editable = false;
                    Drilldown = true;
                }
                field(Quarter3Amount; QuarterAmount[3])
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Quarter 3 Amount';
                    Editable = false;
                    Drilldown = true;
                }
                field(Quarter4Amount; QuarterAmount[4])
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Quarter 4 Amount';
                    Editable = false;
                    Drilldown = true;
                }
                field(TotalAmount; QuarterAmount[5])
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Total Amount';
                    Editable = false;
                    Drilldown = true;
                }
            }
        }
    }
    actions
    {
    }
    trigger OnOpenPage()

    begin
        if UserSetup.get(UserId) then begin
            if Employee.Get(UserSetup."Employee No.") then begin
                if Employee."Global Dimension 2 Code" <> '9011001201' then begin
                    Rec.SetRange("Global Dimension 2 Code", Employee."Global Dimension 2 Code");
                    // Rec.FilterGroup(2);
                    // Rec.SetRange(rec."Global Dimension 1 Code", Employee."Global Dimension 1 Code");
                    // Rec.SetRange(rec."Global Dimension 2 Code", Employee."Global Dimension 2 Code");
                    // Rec.FilterGroup(0)
                end
            end;

        end;
    end;

    trigger OnAfterGetRecord()
    begin
        Rec.GetBudgetAmount(QuarterAmount);
    end;

    var
        UserSetup: Record "User Setup";
        Employee: Record Employee;
        QuarterAmount: array[5] of Decimal;
}

