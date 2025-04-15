 
page 50033 "Safari Team"
{
    PageType = ListPart;
    SourceTable = "Project Members";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Work Type"; Rec."Work Type")
                {
                    ApplicationArea = Basic;
                    Caption = 'Destination Town';
                }
                field("Type of Expense"; Rec."Type of Expense")
                {
                    ApplicationArea = Basic;
                    Caption = 'Vote Item';
                    Visible = false;
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Payroll No.';
                }
                field("G/L Account"; Rec."G/L Account")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Task No."; Rec."Task No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                }
                field("Time Period"; Rec."Time Period")
                {
                    ApplicationArea = Basic;
                    Caption = 'No. of Days';
                    Enabled = true;

                    // trigger OnValidate()
                    // begin
                    //     //TESTFIELD("Task No.");
                    //     Rec.TestField("No.");
                    // end;
                }
                field("Direct Unit Cost"; Rec."Direct Unit Cost")
                {
                    Caption = 'Rate';
                    ApplicationArea = Basic;
                    Enabled = false;
                }
                field(Entitlement; Rec.Entitlement)
                {
                    ApplicationArea = Basic;
                    Caption = 'Total Daily Subsistence Allowance';
                }
                field("Transport Costs"; Rec."Transport Costs")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Visible = false;
                }
                field("Total Entitlement"; Rec."Total Entitlement")
                {
                    ApplicationArea = Basic;
                }
                field("Outstanding Amount"; Rec."Outstanding Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Tasks to Carry Out"; Rec."Tasks to Carry Out")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Expected Output"; Rec."Expected Output")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Delivery; Rec.Delivery)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Project Lead"; Rec."Project Lead")
                {
                    ApplicationArea = Basic;
                }
                field(Dimension1Code; DimensionCodes[1])
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    CaptionClass = '1,5,,' + DimensionValue.GetDimensionCaption(1);
                    DrillDown = true;
                    trigger OnDrillDown()
                    begin
                        DimensionValue.DrillDownDimensionValue(1, DimensionCodes[1]);
                    end;
                }
                field(Dimension2Code; DimensionCodes[2])
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    CaptionClass = '1,5,,' + DimensionValue.GetDimensionCaption(2);
                    DrillDown = true;
                    trigger OnDrillDown()
                    begin
                        DimensionValue.DrillDownDimensionValue(2, DimensionCodes[2]);
                    end;
                }
                field(Dimension3Code; DimensionCodes[3])
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    CaptionClass = '1,5,,' + DimensionValue.GetDimensionCaption(3);
                    DrillDown = true;
                    trigger OnDrillDown()
                    begin
                        DimensionValue.DrillDownDimensionValue(3, DimensionCodes[3]);
                    end;
                }
                field(Dimension4Code; DimensionCodes[4])
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    CaptionClass = '1,5,,' + DimensionValue.GetDimensionCaption(4);
                    DrillDown = true;
                    trigger OnDrillDown()
                    begin
                        DimensionValue.DrillDownDimensionValue(4, DimensionCodes[4]);
                    end;
                }
                field(Dimension5Code; DimensionCodes[5])
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    CaptionClass = '1,5,,' + DimensionValue.GetDimensionCaption(5);
                    DrillDown = true;
                    trigger OnDrillDown()
                    begin
                        DimensionValue.DrillDownDimensionValue(5, DimensionCodes[5]);
                    end;
                }
                field(Dimension6Code; DimensionCodes[6])
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    CaptionClass = '1,5,,' + DimensionValue.GetDimensionCaption(6);
                    DrillDown = true;
                    trigger OnDrillDown()
                    begin
                        DimensionValue.DrillDownDimensionValue(6, DimensionCodes[6]);
                    end;
                }
                field(Dimension7Code; DimensionCodes[7])
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    CaptionClass = '1,5,,' + DimensionValue.GetDimensionCaption(7);
                    DrillDown = true;
                    trigger OnDrillDown()
                    begin
                        DimensionValue.DrillDownDimensionValue(7, DimensionCodes[7]);
                    end;
                }
                field(Dimension8Code; DimensionCodes[8])
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    CaptionClass = '1,5,,' + DimensionValue.GetDimensionCaption(8);
                    DrillDown = true;
                    trigger OnDrillDown()
                    begin
                        DimensionValue.DrillDownDimensionValue(8, DimensionCodes[8]);
                    end;
                }

            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(myBoolean: Boolean);
    begin
        Rec.Type := Rec.Type::Person;
        // if Rec.Type = Rec.Type::Machine then
        //   Show:=true;

        // editTransport:=false;
        // EditDays:=true;


        // if ImprestMemo.Get(Rec."Imprest Memo No.") then begin




        // ApprovalEntry.Reset;
        // ApprovalEntry.SetRange("Table ID",57008);
        // //ApprovalEntry.SETRANGE("Document Type","Document Type"::im","Document Type"::"Imprest memo");
        // ApprovalEntry.SetRange("Document No.",ImprestMemo."No.");
        // ApprovalEntry.SetRange("Sequence No.",1);
        // ApprovalEntry.SetRange(Status,ApprovalEntry.Status::Open);
        // ApprovalEntry.SetFilter("Approver ID",'<>%1',ApprovalEntry."Sender ID");

        // if ApprovalEntry.FindFirst then begin
        //   editTransport:=true;
        //   EditDays:=false;
        //         Rec.Modify;

        // //MESSAGE(ImprestMemo."No.");

        // end;

        // end;
    end;

    trigger OnAfterGetRecord()
    begin
        clear(DimensionCodes);
        DimensionMgt.GetShortcutDimensions(Rec."Dimension Set ID", DimensionCodes);
    end;

    var
        [InDataSet]
        Show: Boolean;
        editTransport: Boolean;
        ApprovalEntry: Record "Approval Entry";
        ImprestMemo: Record "Imprest Memo";
        EditDays: Boolean;
        DimensionMgt: Codeunit DimensionManagement;
        DimensionCodes: array[8] of Code[20];
        DimensionValue: Record "Dimension Value";
}

#pragma implicitwith restore

