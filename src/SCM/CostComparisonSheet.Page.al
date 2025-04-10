Page 75418 "Cost Comparison Sheet"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = "Cost Comparison Sheet";
    SourceTableView = sorting("Entry No", "Bid Evaluation Register", "Document No.")
                      order(ascending);

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Buy-from Vendor No."; "Buy-from Vendor No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Bidder Name"; "Bidder Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Awarded; Awarded)
                {
                    ApplicationArea = Basic;
                }
                field(Type; Type)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("No."; "No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Technical Specifications"; "Technical Specifications")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Unit of Measure Code"; "Unit of Measure Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Quantity; Quantity)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Location Code"; "Location Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Direct Unit Cost"; "Direct Unit Cost")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Amount; Amount)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Amount Including VAT"; "Amount Including VAT")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Plan ID"; "Procurement Plan ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Procurement Plan Entry No"; "Procurement Plan Entry No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("PP Planning Category"; "PP Planning Category")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("PP Preference/Reservation Code"; "PP Preference/Reservation Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("IFS Code"; "IFS Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Job No"; "Job No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Job Task No"; "Job Task No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control15; Outlook)
            {
                ApplicationArea = All;
            }
            systempart(Control16; Notes)
            {
                ApplicationArea = All;
            }
            systempart(Control17; MyNotes)
            {
                ApplicationArea = All;
            }
            systempart(Control18; Links)
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
    }
}

