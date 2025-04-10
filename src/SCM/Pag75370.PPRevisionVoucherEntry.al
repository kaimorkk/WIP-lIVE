page 75370 "PP Revision Voucher Entry"
{
    Caption = 'Procurement Plan Revision Entries';
    PageType = List;
    SourceTable = "Procurement Plan Entry";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Modified; Modified)
                {
                    ApplicationArea = Basic;
                }
                field(ProcurementPlanID; "Procurement Plan ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = ProcurementPlanNoVisible;
                }
                field(RevisedPlanNo; "Revised Plan No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(EntryNo; "Entry No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(VoteItem; "Vote Item")
                {
                    ApplicationArea = Basic;
                }
                field(PlanItemType; "Plan Item Type")
                {
                    ApplicationArea = Basic;
                }
                field(PlanItemNo; "Plan Item No")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
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
                //"Alternative Procurement Methods"
                field("Alternative Procurement Methods"; Rec."Other Procurement Methods")
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
                field("Requisition Product Group"; Rec."Requisition Product Group")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Use"; Rec."Procurement Use")
                {
                    ApplicationArea = Basic;
                }
                field("Invitation Notice Type"; Rec."Invitation Notice Type")
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
                    Caption = 'Total Estimated Cost';
                    ApplicationArea = Basic;
                }
                field("Total Actual Costs"; Rec."Total Actual Costs")
                {
                    ApplicationArea = Basic;
                }
                field("Total PRN Commitments"; Rec."Total PRN Commitments")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total PRN Commitments field.';
                }
                field("Available Procurement Budget"; Rec."Available Procurement Budget")
                {
                    ApplicationArea = Basic;

                }
                // field("Total Purchase Commitments"; Rec."Total Purchase Commitments")
                // {
                //     ApplicationArea = Basic;
                // }
                // field(Region; Rec.Region)
                // {
                //     ApplicationArea = Basic;
                //     Visible = false;
                // }
                // field(Directorate; Rec.Directorate)
                // {
                //     ApplicationArea = Basic;

                // }
                // field(Department; Rec.Department)
                // {
                //     ApplicationArea = Basic;

                // }
                // field(Constituency; Rec.Constituency)
                // {
                //     ApplicationArea = Basic;
                //     Visible = false;
                // }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Shortcut Dimension 4 Code"; Rec."Shortcut Dimension 4 Code")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Shortcut Dimension 5 Code"; Rec."Shortcut Dimension 5 Code")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Shortcut Dimension 6 Code"; Rec."Shortcut Dimension 6 Code")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Shortcut Dimension 7 Code"; Rec."Shortcut Dimension 7 Code")
                {
                    ApplicationArea = Basic, Suite;
                    Visible = false;
                }
                field("Shortcut Dimension 8 Code"; Rec."Shortcut Dimension 8 Code")
                {
                    ApplicationArea = Basic, Suite;
                    Visible = false;
                }
                field("Procurement Start Date"; Rec."Procurement Start Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Procurement End Date"; Rec."Procurement End Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Procurement Duration (Days)"; Rec."Procurement Duration (Days)")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                // field("Business Unit Code"; Rec."Business Unit Code")
                // {
                //     ApplicationArea = Basic;
                // }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Budget Control Job No"; Rec."Budget Control Job No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Budget Control Job Task No."; Rec."Budget Control Job Task No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Budget Account"; Rec."Budget Account")
                {
                    ApplicationArea = Basic;
                }


                field("Q1 Quantity"; Rec."Q1 Quantity")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Q1 Quantity field.';
                }
                field("Q1 Amount"; Rec."Q1 Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Q1 Amount field.';
                }
                field("Q1 Budget"; Rec."Q1 Budget")
                {
                    ApplicationArea = Basic, Suite;
                    Visible = false;
                }
                field("Q2 Quantity"; Rec."Q2 Quantity")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Q2 Quantity field.';
                }
                field("Q2 Amount"; Rec."Q2 Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Q2 Amount field.';
                }
                field("Q2 Budget"; Rec."Q2 Budget")
                {
                    ApplicationArea = Basic, Suite;
                    Visible = false;
                }
                field("Q3 Quantity"; Rec."Q3 Quantity")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Q3 Quantity field.';
                }
                field("Q3 Amount"; Rec."Q3 Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Q3 Amount field.';
                }
                field("Q3 Budget"; Rec."Q3 Budget")
                {
                    ApplicationArea = Basic, Suite;
                    Visible = false;
                }
                field("Q4 Quantity"; Rec."Q4 Quantity")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Q4 Quantity field.';
                }
                field("Q4 Amount"; Rec."Q4 Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Q4 Amount field.';
                }
                field("Q4 Budget"; Rec."Q4 Budget")
                {
                    ApplicationArea = Basic, Suite;
                    Visible = false;
                }
                field("Work Plan Project ID"; Rec."Work Plan Project ID")
                {
                    ApplicationArea = All;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Work Plan Project ID field.';
                }
                field("Workplan Task No."; Rec."Workplan Task No.")
                {
                    ApplicationArea = All;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Workplan Task No. field.';
                }
                field("Activity No"; Rec."Activity No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Activity No field.';
                }
                field("Sub Activity No"; Rec."Sub Activity No")
                {
                    ApplicationArea = All;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Sub Activity No field.';
                }
                field("AGPO %"; Rec."AGPO %")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the AGPO % field.';
                }
                field("AGPO Amount"; Rec."AGPO Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the AGPO Amount field.';
                }
                field("PWD %"; Rec."PWD %")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the PWD % field.';
                }
                field("PWD Amount"; Rec."PWD Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the PWD Amount field.';
                }
                field("Women %"; Rec."Women %")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Women % field.';
                }
                field("Women Amount"; Rec."Women Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Women Amount field.';
                }
                field("Youth %"; Rec."Youth %")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Youth % field.';
                }
                field("Youth Amount"; Rec."Youth Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Youth Amount field.';
                }
                field("Margin of Preference"; Rec."Margin of Preference")
                {
                    ApplicationArea = All;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Margin of Preference field.';
                }
                field("Citizen Contractors %"; Rec."Citizen Contractors %")
                {
                    ApplicationArea = All;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Citizen Contractors % field.';
                }

                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Blocked)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control37; Outlook)
            {
                ApplicationArea = All;
            }
            systempart(Control38; Notes)
            {
                ApplicationArea = All;
            }
            systempart(Control39; MyNotes)
            {
                ApplicationArea = All;
            }
            systempart(Control40; Links)
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Update Prices")
            {
                ApplicationArea = Basic;
                Image = Suggest;

                trigger OnAction()
                begin
                    if Confirm('Are you sure you sure you want to update the price for this item ?', true) then begin
                        Items.Reset;
                        Items.SetRange("No.", "Plan Item No");
                        if Items.FindSet then
                            if Items."Unit Cost" <> 0 then begin
                                "Unit Cost" := Items."Unit Cost";
                            end else begin
                                "Unit Cost" := Items."Last Direct Cost";
                            end;
                        Validate("Unit Cost");
                        Message('Price Update Successfully');
                    end;
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Update Prices_Promoted"; "Update Prices")
                {
                }
            }
        }
    }

    trigger OnInit()
    begin
        //ProcurementPlanNoVisible:=TRUE;
    end;

    var
        ProcurementPlanNo: Code[20];

        ProcurementPlanNoVisible: Boolean;

        ProcurementPlanLineNoVisible: Boolean;
        Items: Record Item;


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

