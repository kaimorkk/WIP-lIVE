

page 75059 "Posted Procurement Plan Entrie"
{
    Editable = false;
    PageType = List;
    SourceTable = "Procurement Plan Entry";
    UsageCategory = History;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Procurement Plan ID"; Rec."Procurement Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = Basic;
                }
                field("Planning Category"; Rec."Planning Category")
                {
                    ApplicationArea = Basic;
                }
                field("Work Plan Project ID"; Rec."Work Plan Project ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Type"; Rec."Procurement Type")
                {
                    ApplicationArea = Basic;
                }
                field("Solicitation Type"; Rec."Solicitation Type")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Method"; Rec."Procurement Method")
                {
                    ApplicationArea = Basic;
                }
                field("Preference/Reservation Code"; Rec."Preference/Reservation Code")
                {
                    ApplicationArea = Basic;
                }
                field("Funding Source ID"; Rec."Funding Source ID")
                {
                    ApplicationArea = Basic;
                }
                field("Planning Date"; Rec."Planning Date")
                {
                    ApplicationArea = Basic;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Basic;
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    ApplicationArea = Basic;
                }
                field("Line Budget Cost"; Rec."Line Budget Cost")
                {
                    ApplicationArea = Basic;
                }
                field(Region; Rec.Region)
                {
                    ApplicationArea = Basic;
                }
                field(Directorate; Rec.Directorate)
                {
                    ApplicationArea = Basic;
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                }
                field(Constituency; Rec.Constituency)
                {
                    ApplicationArea = Basic;
                }
                field("Road No."; Rec."Road No.")
                {
                    ApplicationArea = Basic;
                }
                field("Road Name"; Rec."Road Name")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Start Date"; Rec."Procurement Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement End Date"; Rec."Procurement End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Duration (Days)"; Rec."Procurement Duration (Days)")
                {
                    ApplicationArea = Basic;
                }
                field("Business Unit Code"; Rec."Business Unit Code")
                {
                    ApplicationArea = Basic;
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = Basic;
                }
                field("Dimension Set ID"; Rec."Dimension Set ID")
                {
                    ApplicationArea = Basic;
                }
                field("Budget Control Job No"; Rec."Budget Control Job No")
                {
                    ApplicationArea = Basic;
                }
                field("Budget Control Job Task No."; Rec."Budget Control Job Task No.")
                {
                    ApplicationArea = Basic;
                }
                field("Budget Account"; Rec."Budget Account")
                {
                    ApplicationArea = Basic;
                }

                field("Transferred from Item Budget"; Rec."Transferred from Item Budget")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control37; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control38; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control39; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control40; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }

    var
        ProcurementPlanNo: Code[20];

        ProcurementPlanNoVisible: Boolean;

        ProcurementPlanLineNoVisible: Boolean;


    procedure SetProcurementNo(No: Code[20])
    begin
        ProcurementPlanNo := No;
    end;


    procedure SetProcurementNoVisible(NewJobNoVisible: Boolean)
    begin
        ProcurementPlanNoVisible := NewJobNoVisible;
    end;


    procedure SetProcuremntLineNoVisible(NewJobTaskNoVisible: Boolean)
    begin
        ProcurementPlanLineNoVisible := NewJobTaskNoVisible;
    end;
}

#pragma implicitwith restore

