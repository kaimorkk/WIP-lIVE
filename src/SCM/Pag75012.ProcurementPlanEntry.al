

page 75012 "Procurement Plan Entry"
{
    PageType = List;
    SourceTable = "Procurement Plan Entry";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Procurement Plan ID"; Rec."Procurement Plan ID")
                {
                    ApplicationArea = Basic;
                    Visible = ProcurementPlanNoVisible;
                    Editable = false;
                }
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = Basic;
                    Visible = ProcurementPlanLineNoVisible;
                }
                field("Planning Category"; Rec."Planning Category")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                // field("Work Plan Project ID"; Rec."Work Plan Project ID")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Workplan Task No."; Rec."Workplan Task No.")
                // {
                //     ApplicationArea = Basic;
                // }
                field("Item Type"; Rec."Plan Item Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Plan Item Type field.';
                }
                field("Item No"; Rec."Plan Item No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Plan Item No field.';
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
                //"Alternative Procurement Methods"
                field("Alternative Procurement Methods"; Rec."Other Procurement Methods")
                {
                    ApplicationArea = Basic;
                }
                field("Preference/Reservation Code"; Rec."Preference/Reservation Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Funding Source ID"; Rec."Funding Source ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
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
                    Visible = false;
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
                    Editable = false;
                }
                field("Total PRN Commitments"; Rec."Total PRN Commitments")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Total PRN Commitments field.';
                }
                field("Available Procurement Budget"; Rec."Available Procurement Budget")
                {
                    ApplicationArea = Basic;
                    Visible = false;
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
                    visible = false;
                }
                field("Shortcut Dimension 4 Code"; Rec."Shortcut Dimension 4 Code")
                {
                    ApplicationArea = Basic, Suite;
                    visible = false;
                }
                field("Shortcut Dimension 5 Code"; Rec."Shortcut Dimension 5 Code")
                {
                    ApplicationArea = Basic, Suite;
                    visible = false;
                }
                field("Shortcut Dimension 6 Code"; Rec."Shortcut Dimension 6 Code")
                {
                    ApplicationArea = Basic, Suite;
                    visible = false;
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
                    visible = false;
                }
                field("Budget Control Job No"; Rec."Budget Control Job No")
                {
                    ApplicationArea = Basic;
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
                    Visible = false;
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
                    ToolTip = 'Specifies the value of the Citizen Contractors % field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = All;
                    editable = false;
                    Caption = 'Amended Plan Entry';
                    ToolTip = 'Specifies the Value of plan entry amended.', Comment = '%';
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
        //"Plan Procurement Method"
        area(processing)
        {

            action(ProcurementPlanningEntries)
            {
                ApplicationArea = Jobs;
                Caption = 'Procurement Method';
                Image = JobLines;
                Visible = false;
                ShortCutKey = 'Shift+Ctrl+P';
                RunObject = Page "Plan Procurement Method";
                RunPageLink = "Procurement Plan ID" = field("Procurement Plan ID"),
                              "Planning Category" = field("Planning Category"),
                              "Plan Entry No." = field("Entry No.");
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(ProcurementPlanningEntries_Promoted; ProcurementPlanningEntries)
                {
                }
            }
        }
    }

    trigger OnInit()
    begin
        //ProcurementPlanNoVisible:=TRUE;
    end;

    trigger OnAfterGetRecord()
    var
        myInt: Integer;
        availlable: Decimal;
    begin
        if Rec."Line Budget Cost" <> 0 then begin
            Rec.calcfields("Total PRN Commitments");

            availlable := Rec."Line Budget Cost" - Rec."Total PRN Commitments";
            if availlable > 0 then begin
                Rec."Available Procurement Budget" := availlable;
            end else begin
                Rec."Available Procurement Budget" := 0;
            end;

        end;


    end;

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

