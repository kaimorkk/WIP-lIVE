pageextension 51112 "Employee Qualifications" extends "Employee Qualifications"
{
    layout
    {
        addbefore(Control1900383207)
        {
            part(Attachment; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = const(Database::"Employee Qualification"),
                              "No." = field("Employee No."),
                              "Line No." = field("Line No.");
            }
        }
    }
}
