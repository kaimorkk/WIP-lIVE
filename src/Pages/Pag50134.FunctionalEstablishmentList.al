page 50134 "Functional Establishment List"
{
    Caption = 'Functional Establishment Plan';
    PageType = ListPart;
    SourceTable = "Establishment Plan Position";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Job ID"; Rec."Job ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Job ID field.';
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Job Title field.';
                }
                field("Designation Group"; Rec."Designation Group")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Designation Group field.';
                }
                field("Directorate Code"; Rec."Directorate Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Directorate Code field.';
                }
                field("Current Head Count Functional"; Rec."Current No Functional")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Current No Functional field.';
                }
                field("Actual Suspended"; Rec."Actual Suspended Function")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Actual Suspended field.';
                }
                field("Actual Terminated"; Rec."Actual Terminated Function")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Actual Terminated field.';
                }
                field("Approved No."; Rec."Approved No. Function")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Staff Establishment field.';
                }
                field("Actual Active"; Rec."Actual Active Function")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Current Headcount field.';
                }
                field(Variance; Rec.Variance)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Variance field.';
                }
            }
        }

    }
    trigger OnAfterGetRecord()
    begin
        if Rec."Approved No. Function" > 0 then begin
            Rec.Variance := Rec."Approved No. Function" - Rec."Actual Active Function";
            Rec.MODIFY(true);
        end;
    end;
}
