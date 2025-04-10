page 70089 "Purchase Requisition API"
{
    APIGroup = 'Procurement';
    APIPublisher = 'Greencom';
    APIVersion = 'v1.0';
    Caption = 'purchaseRequisitionAPI';
    DelayedInsert = true;
    EntityName = 'Greencom';
    EntitySetName = 'entitySetName';
    PageType = API;
    SourceTable = "Purchase Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(No; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(PRNType; Rec."PRN Type")
                {
                    ApplicationArea = Basic;
                }
                field(DocumentDate; Rec."Document Date")
                {
                    ApplicationArea = Basic;

                }

                field(LocationCode; Rec."Location Code")
                {
                    ApplicationArea = Basic;

                }
                field(RequisitionProductGroup; Rec."Requisition Product Group")
                {
                    ApplicationArea = Basic;
                }


                field(RequesterID; Rec."Requester ID")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field(RequestByNo; Rec."Request-By No.")
                {
                    ApplicationArea = Basic;

                }
                field(RequestByName; Rec."Request-By Name")
                {
                    ApplicationArea = Basic;

                }
                field(ShortcutDimension1Code; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                // field(DepartmentName; Rec."Department Name")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Geographical Location Name';
                // }

                field(ShortcutDimension2Code; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                // field(ProjectName; Rec."Project Name")
                // {
                //     ApplicationArea = Basic;
                //     caption = 'Administrative Unit Name';
                // }

                field(ProcurementPlanID; Rec."Procurement Plan ID")
                {
                    ApplicationArea = Basic;
                }

                field(PurchaserCode; Rec."Purchaser Code2")
                {
                    ApplicationArea = Basic;
                }

                field(AssignedOfficer; Rec."Assigned Officer")
                {
                    ApplicationArea = all;
                    Editable = false;
                }

                field(PPPlanningCategory; Rec."PP Planning Category")
                {
                    ApplicationArea = Basic;
                }

                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    editable = false;
                }
                field(PPTotalBudget; Rec."PP Total Budget")
                {
                    ApplicationArea = Basic;
                }
                field(PPTotalActualCosts; Rec."PP Total Actual Costs")
                {
                    ApplicationArea = Basic;
                }

                field(PPSolicitationType; Rec."PP Solicitation Type")
                {
                    ApplicationArea = Basic;
                }
                field(OtherProcurementMethods; Rec."Other Procurement Methods")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Alternative Procurement Methods field.', Comment = '%';
                }

                field(PPProcurementMethod; Rec."PP Procurement Method")
                {
                    ApplicationArea = Basic;
                }
                field(PPInvitationNoticeType; Rec."PP  Invitation Notice Type")
                {
                    ApplicationArea = Basic;
                }
                field(PPPreferenceReservationCode; Rec."PP Preference/Reservation Code")
                {
                    ApplicationArea = Basic;
                }
                field(PRNConversionProcedure; Rec."PRN Conversion Procedure")
                {
                    ApplicationArea = Basic;
                }
                field(OrderedPRN; Rec."Ordered PRN")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(LinkedIFSNo; Rec."Linked IFS No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(LinkedLPONo; Rec."Linked LPO No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(ConsolidatePRN; Rec."Consolidate PRN")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Consolidate PRN field.';
                }
                field(ConsolidateToIFSNo; Rec."Consolidate to IFS No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Consolidate to IFS No. field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;

                }

            }
        }

    }
}
