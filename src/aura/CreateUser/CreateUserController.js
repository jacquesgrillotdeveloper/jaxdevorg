({    
   init : function(component, event, helper) {
      var action = component.get("c.getCaseStudy");
      action.setParams({"recordId": component.get("v.recordId")});
    
      action.setCallback(this, function(response) {
         var state = response.getState();
         if(component.isValid() && state == "SUCCESS"){
             component.set("v.caseStudy", response.getReturnValue());
          } else {
             console.log('There was a problem and the state is: '+state);
          }
      });
      $A.enqueueAction(action);
   },
    
   updateNickname: function(component, event, helper) {
      // Update the nickname field when 'tab' is pressed
      if (event.getParams().keyCode == 9) {
         var nameInput = component.find("firstName");
         var nameValue = nameInput.get("v.value");
         var nickName = component.find("nickname");
         var today = new Date();
         nickName.set("v.value", nameValue + today.valueOf(today));   
      }
   },
 
   saveUserForm : function(component, event, helper) {
      var name = component.get("v.user.first");
      var last = component.get("v.user.last");
      var password = component.get("v.user.Password__c");
      var email = component.get("v.user.Email__c");
      var nickname = component.get("v.user.nickname");
        
      var passwordCmp = component.find("userPassword");
      var emailCmp = component.find("userEmail");
        
      helper.validatePassword(component, event, helper);
      helper.validateEmail(component, event, helper);

      if (passwordCmp.get("v.errors") == null && emailCmp.get("v.errors") == null) {
         component.set("v.hasErrors", false);
         helper.save(component,name + " " + last,password,email,nickname);         
      } else {
         component.set("v.hasErrors", true);
      }
   },
    
   cancel : function(component, event, helper) {
      $A.get("e.force:closeQuickAction").fire();
   }
})