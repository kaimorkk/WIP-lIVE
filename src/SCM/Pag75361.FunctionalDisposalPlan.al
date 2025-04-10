page 75361 "Functional Disposal Plan"
{
    PageType = Card;
    SourceTable = "Annual Disposal plan Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Disposal Catetory"; Rec."Disposal Catetory")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Disposal Catetory field.', Comment = '%';
                }
                field(No; No)
                {
                    ApplicationArea = All;
                }
                field("Financial Year Code"; "Financial Year Code")
                {
                    ApplicationArea = All;
                }
                field("Start Date"; "Start Date")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("End Date"; "End Date")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field(Description; Description)
                {
                    ApplicationArea = All;
                }
                field("Consolidate Disposal Plan"; "Consolidate Disposal Plan")
                {
                    ApplicationArea = All;
                }
                field("Created By"; "Created By")
                {
                    ApplicationArea = All;
                }
                field("Date Created"; "Date Created")
                {
                    ApplicationArea = All;
                }
                field("Time Created"; "Time Created")
                {
                    ApplicationArea = All;
                }
                field("Global Dimension 1 Code"; "Global Dimension 1 Code")
                {
                    ApplicationArea = All;
                }
                field("Geo Graphical Name"; "Geo Graphical Name")
                {
                    ApplicationArea = all;
                    Caption = 'Geo Graphical Name';
                }
                field("Global Dimension 2 Code"; "Global Dimension 2 Code")
                {
                    ApplicationArea = All;
                }
                field("Document Status"; "Document Status")
                {
                    ApplicationArea = All;
                }

            }
            part(Subform; 70146)
            {
                SubPageLink = "Disposal header" = field("No"),
                              "Disposal Catetory" = field("Disposal Catetory");
                ApplicationArea = All;
            }
        }

    }

    actions
    {
        area(processing)
        {
        }
        area(navigation)
        {
            group("Procurement Plan")
            {
                Caption = 'Procurement Plan';
                action("Send Approval Request")
                {
                    Caption = 'Send Approval Request';
                    Image = SendApprovalRequest;
                    ApplicationArea = All;

                    trigger OnAction()
                    var
                        CustomAppr: Codeunit "Custom Approvals Codeunit";
                        ApprovalMgt: Codeunit "Approvals Mgmt.";
                    begin
                        Varvariant := Rec;
                        if CustomAppr.CheckApprovalsWorkflowEnabled(Varvariant) then
                            CustomAppr.OnSendDocForApproval(Varvariant);
                    end;
                }
                action("<Action1000000042>")
                {
                    Caption = 'Cancel Approval Request';
                    Image = CancelApprovalRequest;
                    ApplicationArea = All;

                    trigger OnAction()
                    var
                        CustomApp: Codeunit "Custom Approvals Codeunit";

                    //ApprovalMgt: Codeunit "1535";
                    begin
                        Varvariant := Rec;
                        CustomApp.OnCancelDocApprovalRequest(Varvariant);
                        //IF ApprovalMgt.CancelPrcmntPlaApprovalRequest(Rec,TRUE,TRUE) THEN;
                    end;
                }
                action(Approvals)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Approvals';
                    Image = Approvals;
                    ToolTip = 'Specifies the Approval entries of the document';

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.OpenApprovalEntriesPage(rec.RecordId);
                    end;
                }
                action("Copy Procurement Plan")
                {
                    Caption = 'Copy Procurement Plan';
                    //RunObject = Report 57022;
                    ApplicationArea = All;
                }
                action("Suggest Disposal Items")
                {
                    Image = Suggest;
                    ApplicationArea = All;

                    trigger OnAction()
                    var
                        BookValue: Decimal;
                    begin
                        TESTFIELD("Global Dimension 1 Code");
                        TESTFIELD("Global Dimension 2 Code");
                        FixedAsset.RESET;
                        FixedAsset.SETRANGE("Suggested For Disposal", false);
                        FixedAsset.SETRANGE("Marked for Disposal", true);
                        FixedAsset.SETRANGE("Global Dimension 1 Code", "Global Dimension 1 Code");
                        FixedAsset.SETRANGE("Global Dimension 2 Code", "Global Dimension 2 Code");
                        if FixedAsset.FIND('-') then begin
                            repeat
                                BookValue := 0;
                                FADepreciationBook.RESET;
                                FADepreciationBook.SETRANGE("FA No.", FixedAsset."No.");
                                if FADepreciationBook.FIND('-') then begin
                                    BookValue := GetBookValue(FADepreciationBook);
                                    // IF BookValue=0 THEN BEGIN
                                    //MESSAGE('Disposal Amount %1',BookValue);
                                    DisposalPlanLines.RESET;
                                    DisposalPlanLines.SETRANGE("Disposal header", No);
                                    if DisposalPlanLines.FIND('-') then
                                        DisposalPlanLines.FINDLAST;

                                    LineNumber := DisposalPlanLines."Line No." + 1;
                                    DisposalPlanLinesN.INIT;
                                    DisposalPlanLinesN."Disposal header" := No;
                                    DisposalPlanLinesN."Line No." := LineNumber;
                                    DisposalPlanLinesN."Disposal Catetory" := DisposalPlanLinesN."Disposal Catetory"::"Functional Disposal";
                                    DisposalPlanLinesN."Market Value" := DisposalPlanLines."Market Value";
                                    DisposalPlanLinesN.Type := DisposalPlanLines.Type::"Fixed Asset";
                                    DisposalPlanLinesN."Item No." := FixedAsset."No.";
                                    DisposalPlanLinesN."Description of Item" := FixedAsset.Description;
                                    DisposalPlanLinesN."Estimated current value" := BookValue;
                                    DisposalPlanLinesN.INSERT(true);
                                    //END;
                                end;
                                FixedAsset."Suggested For Disposal" := true;
                                FixedAsset.MODIFY;
                            until FixedAsset.NEXT = 0;
                        end;
                        MESSAGE('Items Suggested Successfully');
                    end;
                }
                action("Import Disposal Plan")
                {
                    RunObject = XMLport 50020;
                    ApplicationArea = All;
                }
                action("Update Budget Entries")
                {
                    Caption = 'Update Budget Entries';
                    Image = UpdateUnitCost;
                    Visible = false;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        ProcPlanItem.RESET;
                        ProcPlanItem.SETRANGE(ProcPlanItem."Plan Year", No);
                        //ProcPlanItem.SETRANGE(Type,ProcPlanItem.Type::"G/L Account");
                        ProcPlanItem.SETFILTER(ProcPlanItem."Estimated Cost", '<>%1', 0);
                        if ProcPlanItem.FIND('-') then begin

                            repeat
                                BudgetEntries.RESET;
                                BudgetEntries.SETRANGE("Budget Name", ProcPlanItem."Plan Year");
                                BudgetEntries.SETRANGE("Procurement Item", ProcPlanItem."Plan Item No");
                                //BudgetEntries.SETRANGE("G/L Account No.",ProcPlanItem."No.");
                                if BudgetEntries.FINDSET then begin
                                    BudgetEntries.Date := "Start Date";
                                    BudgetEntries."Budget Name" := ProcPlanItem."Plan Year";

                                    //Update G/L if Item
                                    if ProcPlanItem.Type = ProcPlanItem.Type::Item then begin

                                        if ItemRec.GET(ProcPlanItem."No.") then begin
                                            GenPostingSetup.RESET;
                                            GenPostingSetup.SETRANGE(GenPostingSetup."Gen. Bus. Posting Group", '');
                                            GenPostingSetup.SETRANGE(GenPostingSetup."Gen. Prod. Posting Group", ItemRec."Gen. Prod. Posting Group");
                                            if GenPostingSetup.FIND('+') then
                                                BudgetEntries."G/L Account No." := GenPostingSetup."Inventory Adjmt. Account";
                                        end;
                                    end;

                                    //Update GL if FA
                                    if ProcPlanItem.Type = ProcPlanItem.Type::"Fixed Asset" then begin
                                        FADepreciation.RESET;
                                        FADepreciation.SETRANGE(FADepreciation."FA No.", ProcPlanItem."No.");
                                        if FADepreciation.FIND('-') then
                                            if FAPostingGp.GET(FADepreciation."FA Posting Group") then
                                                if ProcPlanItem.Type = ProcPlanItem.Type::"G/L Account" then
                                                    BudgetEntries."G/L Account No." := FAPostingGp."Acquisition Cost Account";
                                    end;

                                    //Update GL if GL
                                    if ProcPlanItem.Type = ProcPlanItem.Type::"G/L Account" then
                                        BudgetEntries."G/L Account No." := ProcPlanItem."No.";

                                    BudgetEntries.Description := ProcPlanItem."Item Description";
                                    BudgetEntries."Global Dimension 1 Code" := ProcPlanItem."Department Code";
                                    //BudgetEntries."Global Dimension 2 Code":=ProcPlanItem."Global Dimension 2 Code";
                                    BudgetEntries.Amount := ProcPlanItem."Estimated Cost";
                                    BudgetEntries."Procurement Item" := ProcPlanItem."Plan Item No";
                                    if BudgetEntries.Amount <> 0 then
                                        BudgetEntries.MODIFY(true);
                                end else begin

                                    BudgetEntries.INIT;
                                    BudgetEntries."Entry No." := 0;
                                    BudgetEntries.Date := "Start Date";
                                    BudgetEntries."Budget Name" := ProcPlanItem."Plan Year";
                                    BudgetEntries."G/L Account No." := ProcPlanItem."No.";
                                    BudgetEntries.Description := ProcPlanItem."Item Description";
                                    BudgetEntries."Global Dimension 1 Code" := ProcPlanItem."Department Code";
                                    // BudgetEntries."Global Dimension 2 Code":=ProcPlanItem."Global Dimension 2 Code";
                                    BudgetEntries.Amount := ProcPlanItem."Estimated Cost";
                                    BudgetEntries."Procurement Item" := ProcPlanItem."Plan Item No";

                                    //Update G/L if Item
                                    if ProcPlanItem.Type = ProcPlanItem.Type::Item then begin

                                        if ItemRec.GET(ProcPlanItem."No.") then begin
                                            GenPostingSetup.RESET;
                                            GenPostingSetup.SETRANGE(GenPostingSetup."Gen. Bus. Posting Group", '');
                                            GenPostingSetup.SETRANGE(GenPostingSetup."Gen. Prod. Posting Group", ItemRec."Gen. Prod. Posting Group");
                                            if GenPostingSetup.FIND('+') then
                                                BudgetEntries."G/L Account No." := GenPostingSetup."Inventory Adjmt. Account";
                                        end;
                                    end;

                                    //Update GL if FA
                                    if ProcPlanItem.Type = ProcPlanItem.Type::"Fixed Asset" then begin
                                        FADepreciation.RESET;
                                        FADepreciation.SETRANGE(FADepreciation."FA No.", ProcPlanItem."No.");
                                        if FADepreciation.FIND('-') then
                                            if FAPostingGp.GET(FADepreciation."FA Posting Group") then
                                                if ProcPlanItem.Type = ProcPlanItem.Type::"G/L Account" then
                                                    BudgetEntries."G/L Account No." := FAPostingGp."Acquisition Cost Account";
                                    end;

                                    //Update GL if GL
                                    if ProcPlanItem.Type = ProcPlanItem.Type::"G/L Account" then
                                        BudgetEntries."G/L Account No." := ProcPlanItem."No.";


                                    BudgetEntries.INSERT(true);
                                end;


                            until ProcPlanItem.NEXT = 0;

                            MESSAGE('Update Complete!');

                        end;
                    end;
                }
                action(Consolidate)
                {
                    Image = SelectEntries;
                    //Visible = false;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        DisposalPlanLines.RESET;
                        DisposalPlanLines.SETRANGE("Disposal header", No);
                        if DisposalPlanLines.FINDSET then begin
                            repeat
                                //
                                //     DisposalPlanLines.RESET;
                                //     IF DisposalPlanLines.FINDLAST THEN
                                //       LineNumber:=DisposalPlanLines."Line No."+1;
                                DisposalPlanLinesN.INIT;
                                DisposalPlanLinesN.TRANSFERFIELDS(DisposalPlanLines);
                                DisposalPlanLinesN."Disposal header" := "Consolidate Disposal Plan";
                                DisposalPlanLinesN."Disposal Catetory" := DisposalPlanLinesN."Disposal Catetory"::"Consolidated Disposal";
                                DisposalPlanLinesN.INSERT(true);

                            until DisposalPlanLines.NEXT = 0;
                        end;
                        MESSAGE('Disposal Items Loaded to Consolidate Disposal Plans Successfully');
                    end;
                }
                action(Submit)
                {
                    Image = "Action";
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        TESTFIELD("Document Status", "Document Status"::Draft);
                        if CONFIRM('Are you sure you want to submit ?', true) then begin
                            "Document Status" := "Document Status"::Submitted;
                            MESSAGE('Submitted Successfully');
                        end;
                    end;
                }
                action(Print)
                {
                    Image = Print;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        RESET;
                        SETRANGE(No, No);
                        REPORT.RUN(70130, true, true, Rec);
                    end;
                }
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                Caption = 'Process', Comment = 'Generated from the PromotedActionCategories property index 1.';

                actionref("Suggest Disposal Items_Promoted"; "Suggest Disposal Items")
                {
                }
                actionref("Import Disposal Plan_Promoted"; "Import Disposal Plan")
                {
                }
                actionref("Update Budget Entries_Promoted"; "Update Budget Entries")
                {
                }
                actionref(Consolidate_Promoted; Consolidate)
                {
                }
                actionref("Copy Procurement Plan_Promoted"; "Copy Procurement Plan")
                {
                }
            }
            group(Category_Report)
            {
                Caption = 'Report', Comment = 'Generated from the PromotedActionCategories property index 2.';

                actionref(Print_Promoted; Print)
                {
                }
            }
            group(Category_Category4)
            {
                Caption = 'Workflow Process', Comment = 'Generated from the PromotedActionCategories property index 3.';

                actionref("Send Approval Request_Promoted"; "Send Approval Request")
                {
                }
                actionref("<Action1000000042>_Promoted"; "<Action1000000042>")
                {
                }
                actionref(Approvals_Promoted; Approvals)
                {
                }
            }
            group(Category_Category5)
            {
                actionref(Submit_Promoted; Submit)
                {
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Disposal Catetory" := "Disposal Catetory"::"Functional Disposal";
    end;

    trigger OnOpenPage()
    begin
        "Disposal Catetory" := "Disposal Catetory"::"Functional Disposal";
    end;

    var
        ProcPlanItem: Record "Procurement Plan1";
        BudgetEntries: Record "Procurement Plan Entry1";
        GenPostingSetup: Record "General Posting Setup";
        FAPostingGp: Record "FA Posting Group";
        FADepreciation: Record "FA Depreciation Book";
        ItemRec: Record "Item";
        Window: Dialog;
        FixedAsset: Record "Fixed Asset";
        Varvariant: Variant;
        FADepreciationBook: Record "FA Depreciation Book";
        DisposalPlanLines: Record "Disposal Plan Lines";
        LineNumber: Integer;
        DisposalPlanLinesN: Record "Disposal Plan Lines";
        Disposalheader: Record "Annual Disposal plan Header";

    local procedure GetBookValue(FADepreciationBook: Record "FA Depreciation Book"): Decimal
    begin
        if FADepreciationBook."Acquisition Date" > 0D then
            FADepreciationBook.CALCFIELDS("Book Value");
        exit(FADepreciationBook."Book Value");

        //EXIT(FADepreciationBook."Book Value");
    end;
}

