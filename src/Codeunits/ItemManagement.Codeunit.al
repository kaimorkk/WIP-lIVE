Codeunit 52193480 "Item Management"
{

    trigger OnRun()
    begin
    end;

    var
        Text004: label 'The Requisition cannot be posted before it is fully approved';
        Text000: label 'Purchases & Payables Setup doesn''t exist';


    procedure IssueItems(RequisitionRec: Record "Requisition Header1")
    var
        ItemJnLine: Record "Item Journal Line";
        PPSetup: Record "Purchases & Payables Setup";
        Batch: Record "Item Journal Batch";
        RequisitionLines: Record "Requisition Lines1";
        ItemReg: Record "Item Register";
    begin
        
        
        if RequisitionRec.Status<>RequisitionRec.Status::Released then
           Error(Text004);
        
        
          if not PPSetup.Get then
           Error(Text000);
          /*
          IF UPPERCASE(USERID)<>PPSetup."Stores Issuer" THEN
          ERROR(Text005,USERID);
          */
          // Delete Lines Present on the Item Journal Line
          ItemJnLine.Reset;
          ItemJnLine.SetRange("Journal Template Name",PPSetup."Item Issue Journal Template");
          ItemJnLine.SetRange("Journal Batch Name",RequisitionRec."No.");
          ItemJnLine.DeleteAll;
        
          Batch.Init;
          Batch."Journal Template Name":=PPSetup."Item Issue Journal Template";
          Batch.Name:=RequisitionRec."No.";
          if not Batch.Get(Batch."Journal Template Name",Batch.Name) then
          Batch.Insert;
        
        RequisitionLines.Reset;
        RequisitionLines.SetRange(RequisitionLines."Requisition No",RequisitionRec."No.");
        if RequisitionLines.Find('-') then
        repeat
         if RequisitionLines.No <> '' then begin
         ItemJnLine.Init;
         ItemJnLine."Journal Template Name":=PPSetup."Item Issue Journal Template";
         ItemJnLine."Journal Batch Name":=RequisitionRec."No.";
         ItemJnLine."Line No.":=ItemJnLine."Line No."+10000;
         ItemJnLine."Posting Date":=Today;
         ItemJnLine."Entry Type":=ItemJnLine."entry type"::"Negative Adjmt.";
         ItemJnLine."Document No.":=RequisitionLines."Requisition No";
         ItemJnLine."External Document No.":=RequisitionLines."Requisition No";
         ItemJnLine."Item No.":=RequisitionLines.No;
         ItemJnLine.Validate("Item No.");
         ItemJnLine."Shortcut Dimension 1 Code" := RequisitionLines."Global Dimension 1 Code";
         ItemJnLine.Validate("Shortcut Dimension 1 Code");
         ItemJnLine."Shortcut Dimension 2 Code" := RequisitionLines."Global Dimension 2 Code";
         ItemJnLine.Validate("Shortcut Dimension 2 Code");
         ItemJnLine.Quantity:=RequisitionLines."Quantity Approved";
         ItemJnLine.Validate(Quantity);
         if ItemJnLine.Quantity<>0 then
         ItemJnLine.Insert;
         end;
        until RequisitionLines.Next=0;
        
        //Post The Item Issue
        Codeunit.Run(Codeunit::"Item Jnl.-Post",ItemJnLine);
        ItemReg.Reset;
        ItemReg.SetRange(ItemReg."Journal Batch Name",RequisitionRec."No.");
         if ItemReg.Find('+') then begin
            RequisitionRec.Posted:=true;
            RequisitionRec."Posted By":=UserId;
            RequisitionRec."Date Posted":=Today;
            RequisitionRec.Modify;
         end;

    end;


    procedure ReceiveItems(StoreRec: Record "Stores Return Header")
    var
        ItemJnLine: Record "Item Journal Line";
        PPSetup: Record "Purchases & Payables Setup";
        Batch: Record "Item Journal Batch";
        RequisitionLines: Record "Requisition Lines1";
        ItemReg: Record "Item Register";
        StoreLines: Record "Stores Return Lines";
    begin
        
        /*
        IF Status<>Status::Released THEN
        ERROR('The Requisition cannot be posted before it is fully approved');
        */
        
          if not PPSetup.Get then
           Error(Text000);
          /*
          IF UPPERCASE(USERID)<>PPSetup."Stores Issuer" THEN
          ERROR(Text005,USERID);
          */
          // Delete Lines Present on the Item Journal Line
          ItemJnLine.Reset;
          ItemJnLine.SetRange("Journal Template Name",PPSetup."Item Issue Journal Template");
          ItemJnLine.SetRange("Journal Batch Name",StoreRec."No.");
          ItemJnLine.DeleteAll;
        
          Batch.Init;
          Batch."Journal Template Name":=PPSetup."Item Issue Journal Template";
          Batch.Name:=StoreRec."No.";
          if not Batch.Get(Batch."Journal Template Name",Batch.Name) then
          Batch.Insert;
        
        
        StoreLines.Reset;
        StoreLines.SetRange(StoreLines."Requisition No",StoreRec."No.");
        if StoreLines.Find('-') then
        repeat
        
         ItemJnLine.Init;
         ItemJnLine."Journal Template Name":=PPSetup."Item Issue Journal Template";
         ItemJnLine."Journal Batch Name":=StoreRec."No.";
         ItemJnLine."Line No.":=ItemJnLine."Line No."+10000;
         ItemJnLine."Posting Date":=Today;
         ItemJnLine."Entry Type":=ItemJnLine."entry type"::"Positive Adjmt.";
         ItemJnLine."Document No.":=StoreLines."Requisition No";
         ItemJnLine."External Document No.":=StoreLines."Requisition No";
         ItemJnLine."Item No.":=StoreLines.No;
         ItemJnLine.Validate("Item No.");
         ItemJnLine.Quantity:=StoreLines."Quantity Approved";
         ItemJnLine.Validate(Quantity);
         if ItemJnLine.Quantity<>0 then
         ItemJnLine.Insert(true);
        until StoreLines.Next=0;
        
        //Receive the Item
        Codeunit.Run(Codeunit::"Item Jnl.-Post",ItemJnLine);
        
        ItemReg.Reset;
        ItemReg.SetRange(ItemReg."Journal Batch Name",StoreRec."No.");
         if ItemReg.Find('+') then begin
            StoreRec.Posted:=true;
            StoreRec.Modify;
         end;

    end;
}

