page 50360 "Budget Reallocation Req. Lines"
{
    Caption = 'Reallocation Requests';
    PageType = ListPart;
    SourceTable = "Budget Modification Lines";
    SourceTableView = where("ReAllocation Request" = const(true));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Quarter; Rec.Quarter)
                {
                    ApplicationArea = Basic, Suite;
                }
                field("G/L Account No"; Rec."G/L Account No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the G/L Account No field.';
                }
                field("G/L Account Name"; Rec."G/L Account Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the G/L Account Name field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
                field("Shortuct Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Shortuct Dimension 4 Code"; Rec."Shortcut Dimension 4 Code")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Shortuct Dimension 5 Code"; Rec."Shortcut Dimension 5 Code")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Shortuct Dimension 6 Code"; Rec."Shortcut Dimension 6 Code")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Shortuct Dimension 7 Code"; Rec."Shortcut Dimension 7 Code")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Shortuct Dimension 8 Code"; Rec."Shortcut Dimension 8 Code")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Current Balance"; Rec."Current Balance")
                {
                    Caption = 'Current Balance';
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Balance field.';
                }
                field("Allocated Amount"; "Allocated Amount")
                {
                    Caption = 'Current Allocated Amount';
                    ApplicationArea = Basic, Suite;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("New Balance"; Rec."New Balance")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Balance field.';
                }
                field("New Allocated Amount"; Rec."Total Allocated")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'New Allocated Amount';
                }
                field("Allocated Amounts"; Rec."Allocated Amounts")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Quarter Start Date"; Rec."Quarter Start Date")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Quarter End Date"; Rec."Quarter End Date")
                {
                    ApplicationArea = Basic, Suite;
                }
                field(Error; Error)
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Error Message"; Rec."Error Message")
                {
                    ApplicationArea = Basic, Suite;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            group("Allocations")
            {
                Caption = 'Source Accounts';
                visible = AllocationsVisible;
                action("Allocation Lines")
                {
                    Caption = 'Sources';
                    Image = Allocations;
                    ApplicationArea = Basic, Suite;
                    trigger OnAction()
                    var
                        ReAllocationLine: Record "Budget Reallocation Line";
                        ReAllocationLines: Page "Budget Realloc. Alloc. Lines";
                    begin
                        clear(ReAllocationLines);
                        ReAllocationLine.Reset;
                        ReAllocationLine.SetRange("Document No.", Rec."Document No");
                        ReAllocationLine.SetRange("Source Line No", Rec."Line No");
                        ReAllocationLines.GetBudgetLines(Rec);
                        ReAllocationLines.SetTableView(ReAllocationLine);
                        ReAllocationLines.Run();
                        CurrPage.Update();
                    end;
                }
            }
        }
    }
    var
        AllocationsVisible: Boolean;

    trigger OnNewRecord(BelowxRec: Boolean)
    var
        BudgetReAllocHeader: Record "Budget ReAllocation Header";
    begin
        if BudgetReAllocHeader.get("Document No") then begin
            Rec."Budget Code" := BudgetReAllocHeader."Budget Code";
            Rec."Quarter" := BudgetReAllocHeader.Quarter;
        end;
        Rec."ReAllocation Request" := true;
    end;

    procedure SetApplicationsVisible(ApplicationVisible: Boolean)
    begin
        AllocationsVisible := ApplicationVisible;
    end;
}
