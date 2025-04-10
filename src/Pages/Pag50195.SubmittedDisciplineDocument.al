page 50195 "Submitted Discipline Document"
{
    ApplicationArea = All;
    Caption = 'Submitted Grievance List';
    PageType = List;
    SourceTable = "Discipline Applications";
    CardPageId = "Discipline Document";
    UsageCategory = Lists;
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;
    SourceTableView = where(Status = const(Submitted), Type = const(Grievance));

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employee No. field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field(Designation; Rec.Designation)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Designation field.';
                }
                field("Accused Employee"; Rec."Accused Employee")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Accused Employee field.';
                }
                field("Accused Employee Name"; Rec."Accused Employee Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Accused Employee Name field.';
                }
                field("Accused Employee Designation"; Rec."Accused Employee Designation")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Accused Employee Designation field.';
                }
                field("Date Created"; Rec."Date Created")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date Created field.';
                }
                field("Date Submitted"; Rec."Date Submitted")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date Submitted field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
        }
    }


    trigger OnOpenPage()
    begin
        FilterGroup(12);
        SetFilter("Created By", UserId);
        FilterGroup(0);
    end;
}

