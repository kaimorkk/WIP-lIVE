page 50178 "Discipline Document Stage"
{
    ApplicationArea = All;
    Caption = 'Discipline Document Stage';
    PageType = List;
    SourceTable = "Discipline Document Stage";
    DeleteAllowed = false;

    SourceTableView = sorting("Stage No.") order(ascending);
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Attachment Type"; Rec."Attachment Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Attachment Type field.';
                }

                field("Stage No."; Rec."Stage No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Stage No. field.';
                }
                field("Requires CJ Approval"; Rec."Requires CJ Remarks")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Requires CJs Remarks field.';
                }
                field("Requires Email Notification"; Rec."Requires Email Notification")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Requires Email Notification field.';
                }
                field("Email To"; Rec."Email To")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Email To field.';
                }
                field("Email Recepient"; Rec."Email Recepient")
                {
                    ApplicationArea = All;
                    Caption = 'Email Recepients separated by semicolon';
                    ToolTip = 'Specifies the value of the Email Recepient field.';
                }
                field("Email Reminder Period"; Rec."Email Reminder Period")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Email Reminder Period field.';
                }
            }
        }
    }
}
