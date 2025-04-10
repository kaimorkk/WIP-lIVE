page 52193900 "Seconded In List"
{
    ApplicationArea = All;
    Caption = 'Seconded In List';
    PageType = List;
    SourceTable = Employee;
    UsageCategory = Lists;
    SourceTableView = where("Employee Category Type" = const("Second-In"));
    CardPageId = "Seconded In Card";
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;
    Editable = false;

    layout
    {
        area(Content)
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
}
