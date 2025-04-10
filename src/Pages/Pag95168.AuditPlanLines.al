

page 95168 "Audit Plan Lines"
{
    PageType = ListPart;
    SourceTable = "Audit Plan Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Engagement Line No."; Rec."Engagement Line No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Engagement Line No. field.';
                }
                field("Audit Template ID"; Rec."Audit Template ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit Template ID field.';
                }
                field("Audit  Work Type"; Rec."Audit  Work Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit  Work Type field.';
                }
                field("Engagement Name"; Rec."Engagement Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Engagement Name field.';
                }
                field("Engagement Category"; Rec."Engagement Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Engagement Category field.';
                }
                field("Parent Audit Project ID"; Rec."Parent Audit Project ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Parent Audit Project ID field.';
                }
                field("Auditor Type"; Rec."Auditor Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Auditor Type field.';
                }
                field("Lead Auditor ID"; Rec."Lead Auditor ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Lead Auditor ID field.';
                }
                field("Lead Auditor Email"; Rec."Lead Auditor Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Lead Auditor Email field.';
                }
                field("Planned Start Date"; Rec."Planned Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planned Start Date field.';
                }
                field("Planned End Date"; Rec."Planned End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planned End Date field.';
                }
                field("Auditee Type"; Rec."Auditee Type")
                {
                    ApplicationArea = Basic;
                    OptionCaption = ' ,Board,Company-Level,CEOs Office,Division/Section';
                    ToolTip = 'Specifies the value of the Auditee Type field.';
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project ID field.';
                }
                field("Primary Auditee ID"; Rec."Primary Auditee ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Auditee ID field.';
                }
                field("Auditee Name"; Rec."Auditee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Auditee Name field.';
                }
                field("Lead Auditee Representative ID"; Rec."Lead Auditee Representative ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Lead Auditee Representative ID field.';
                }
                field("Lead Auditee Email"; Rec."Lead Auditee Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Lead Auditee Email field.';
                }
                field("Funding Source ID"; Rec."Funding Source ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Funding Source ID field.';
                }
                field("Budget Control Job No"; Rec."Budget Control Job No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budget Control Job No field.';
                }
                field("Budget Control Job Task No."; Rec."Budget Control Job Task No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budget Control Job Task No. field.';
                }
                field("Budget Cost (LCY)"; Rec."Budget Cost (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budget Cost (LCY) field.';
                }
                field("Internal Audit Charter ID"; Rec."Internal Audit Charter ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Internal Audit Charter ID field.';
                }
                field("Chief Audit Executive ID"; Rec."Chief Audit Executive ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Chief Audit Executive ID field.';
                }
                field("Audit Plan Type"; Rec."Audit Plan Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit Plan Type field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Line")
            {
                Caption = '&Line';
                action("Proposed Engagement Team")
                {
                    ApplicationArea = Basic;
                    Caption = 'Proposed Engagement Team';
                    RunObject = Page "Audit Plan Line Teams";
                    RunPageLink = "Audit Plan ID" = field("Audit Plan ID"),
                                  "Engagement Line No." = field("Engagement Line No.");
                    ToolTip = 'Executes the Proposed Engagement Team action.';
                }
                action("Audit Location/Sites")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Audit Plan Line Locations";
                    RunPageLink = "Audit Plan ID" = field("Audit Plan ID"),
                                  "Engagement Line No." = field("Engagement Line No.");
                    ToolTip = 'Executes the Audit Location/Sites action.';
                }
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Dimension Set Entries";
                    Visible = false;
                    ToolTip = 'Executes the Dimensions action.';
                }
                action("Audit PlanLine Objective")
                {
                    ApplicationArea = Basic;
                    Caption = 'Audit Plan Line Objective';
                    RunObject = Page "Audit PlanLine Objective";
                    RunPageLink = "Audit Plan ID" = field("Audit Plan ID"),
                                  "Engagement Line No." = field("Engagement Line No.");
                    ToolTip = 'Executes the Audit Plan Line Objective action.';
                }
                action("Audit Plan Line Risk")
                {
                    ApplicationArea = Basic;
                    Caption = 'Audit Plan Line Risk';
                    RunObject = Page "Audit Plan Line Risk";
                    RunPageLink = "Audit Plan ID" = field("Audit Plan ID"),
                                  "Engagement Line No." = field("Engagement Line No.");
                    ToolTip = 'Executes the Audit Plan Line Risk action.';
                }
            }
        }
    }

    var
        DimMgt: Codeunit "Dimension CaptionClass Mgmt";

    procedure ShowDocDim()
    var
        OldDimSetID: Integer;
    begin
        // OldDimSetID := "Dimension Set ID";
        // "Dimension Set ID" :=
        //  DimMgt.EditDimensionSet2(
        //    "Dimension Set ID",STRSUBSTNO('%1 %2',"Document Type","No."),
        //    "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
        //
        // IF OldDimSetID <> "Dimension Set ID" THEN BEGIN
        //  MODIFY;
        //  IF PurchLinesExist THEN
        //    UpdateAllLineDim("Dimension Set ID",OldDimSetID);
        // END;
    end;
}

#pragma implicitwith restore

