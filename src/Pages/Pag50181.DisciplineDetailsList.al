page 50181 "Discipline Details List"
{
    ApplicationArea = All;
    Caption = 'Discipline Details List';
    PageType = List;
    SourceTable = "Discipline Details";
    CardPageId = "Discipline Details";
    UsageCategory = Lists;
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Discipline Detail No."; Rec."Discipline Detail No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Discipline Detail No. field.';
                }
                field("Discipline Case No."; Rec."Discipline Case No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Discipline Case No. field.';
                }
                field("Document Stage"; Rec."Document Stage")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document Stage field.';
                    LookupPageId = "Discipline Document Stage";
                    Editable = false;

                }
                field("Document Stage Description"; Rec."Document Stage Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document Stage Description field.';
                    Editable = false;
                }
                field(Remarks; Rec.Recommendations)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Remarks field.';
                    Editable = false;

                }
                field("Chief Justice Remarks"; Rec."Chief Justice Remarks")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Chief Justice Remarks field.';
                    Editable = false;

                }

            }
        }
    }




}
