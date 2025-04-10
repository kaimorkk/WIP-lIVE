

page 56174 "Maintenance Forms"
{
    CardPageID = "Maintenance Form";
    Editable = false;
    PageType = List;
    SourceTable = "ICT Issuance Voucher";
    SourceTableView = where(Type = const(Maintenance));
    UsageCategory = Tasks;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Branches Code"; Rec."Branches Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Branches Code field.';
                }
                field(Directorate; Rec.Directorate)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Directorate field.';
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Location Code field.';
                }
                field("Issued By"; Rec."Issued By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Issued By field.';
                }
                field("Document Status"; Rec."Document Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Status field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control14; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control15; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control16; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control17; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

