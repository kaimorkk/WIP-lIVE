

page 56130 "ICT Project Card"
{
    PageType = Card;
    SourceTable = "ICT Project";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Job No"; Rec."Job No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job No field.';
                }
                field("Primary Purchase Contract ID"; Rec."Primary Purchase Contract ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Purchase Contract ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Internal PM"; Rec."Internal PM")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Internal PM field.';
                }
                field("Contracting Project Manager"; Rec."Contracting Project Manager")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contracting Project Manager field.';
                }
                field("Client PM Phone No"; Rec."Client PM Phone No")
                {
                    ApplicationArea = Basic;
                    //ExtendedDatatype = PhoneNo;
                    ToolTip = 'Specifies the value of the Client PM Phone No field.';
                }
                field("Client PM email Address"; Rec."Client PM email Address")
                {
                    ApplicationArea = Basic;
                    ExtendedDatatype = EMail;
                    ToolTip = 'Specifies the value of the Client PM email Address field.';
                }
                field("Responsible ICT Lead"; Rec."Responsible ICT Lead")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsible ICT Lead field.';
                }
                field("External Contract Reference"; Rec."External Contract Reference")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the External Contract Reference field.';
                }
                field("Contractor No."; Rec."Contractor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor No. field.';
                }
                field("Contractor Name"; Rec."Contractor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor Name field.';
                }
                field("Contract Start Date"; Rec."Contract Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract Start Date field.';
                }
                field("Contract End Date"; Rec."Contract End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract End Date field.';
                }
                field("Notice of Award No."; Rec."Notice of Award No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Notice of Award No. field.';
                }
                field("Steering Committee"; Rec."Steering Committee")
                {
                    ApplicationArea = Basic;
                    Caption = 'Steering Committee No';
                    ToolTip = 'Specifies the value of the Steering Committee No field.';
                }
                field("Notice of Award Date"; Rec."Notice of Award Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Notice of Award Date field.';
                }
                field("Awarded Bid No"; Rec."Awarded Bid No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Awarded Bid No field.';
                }
                field("Contract Amount Inc Taxes"; Rec."Contract Amount Inc Taxes")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract Amount Inc Taxes field.';
                }
                field("IFS Code"; Rec."IFS Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the IFS Code field.';
                }
                field("Project status"; Rec."Project status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project status field.';
                }
                field("No. of Filed Project Meetings"; Rec."No. of Filed Project Meetings")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Filed Project Meetings field.';
                }
                field("No. of Daily Work Records"; Rec."No. of Daily Work Records")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Daily Work Records field.';
                }
                field("No. of Inspections"; Rec."No. of Inspections")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Inspections field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control26; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control27; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control28; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control29; Links)
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

