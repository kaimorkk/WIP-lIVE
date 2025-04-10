page 52193897 "Attachee List"
{
    Caption = 'Attachee List';

    PageType = List;
    SourceTable = "Employee";
    SourceTableView = where("Employee Category Type" = const(Attachee));
    UsageCategory = Lists;
    CardPageId = "Attachee Card";
    ApplicationArea = All;
    InsertAllowed = false;
    ModifyAllowed = false;
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Payroll No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = all;
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = all;
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = all;
                }
                field("Job ID"; "Job ID")
                {
                    ApplicationArea = all;
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = all;
                }
                field("Global Dimension  Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = all;
                }
                field("Date Of Join"; Rec."Employment Date")
                {
                    ApplicationArea = All;
                }
                field("Basic Pay"; Rec."Basic Pay")
                {
                    ApplicationArea = all;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = all;
                }
            }
        }
    }
    actions
    {
        area(Navigation)
        {
        }
        area(Promoted)
        {
            group(Category_Report)
            {
                Caption = 'Report', Comment = 'Generated from the PromotedActionCategories property index 2.';
            }
            group(Category_Category4)
            {
                Caption = 'Functions', Comment = 'Generated from the PromotedActionCategories property index 3.';
            }
        }
    }
    trigger OnOpenPage()
    var
    begin
    end;
}
