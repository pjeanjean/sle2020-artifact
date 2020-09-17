/**
 * generated by Xtext 2.19.0
 */
package fr.cea.nabla.nabla.impl;

import fr.cea.nabla.nabla.BasicType;
import fr.cea.nabla.nabla.NablaPackage;
import fr.cea.nabla.nabla.Var;
import fr.cea.nabla.nabla.VarGroupDeclaration;

import java.util.Collection;

import org.eclipse.emf.common.notify.Notification;
import org.eclipse.emf.common.notify.NotificationChain;

import org.eclipse.emf.common.util.EList;

import org.eclipse.emf.ecore.EClass;
import org.eclipse.emf.ecore.InternalEObject;

import org.eclipse.emf.ecore.impl.ENotificationImpl;

import org.eclipse.emf.ecore.util.EObjectContainmentEList;
import org.eclipse.emf.ecore.util.InternalEList;

/**
 * <!-- begin-user-doc -->
 * An implementation of the model object '<em><b>Var Group Declaration</b></em>'.
 * <!-- end-user-doc -->
 * <p>
 * The following features are implemented:
 * </p>
 * <ul>
 *   <li>{@link fr.cea.nabla.nabla.impl.VarGroupDeclarationImpl#getType <em>Type</em>}</li>
 *   <li>{@link fr.cea.nabla.nabla.impl.VarGroupDeclarationImpl#getVariables <em>Variables</em>}</li>
 * </ul>
 *
 * @generated
 */
public class VarGroupDeclarationImpl extends InstructionImpl implements VarGroupDeclaration
{
  /**
   * The default value of the '{@link #getType() <em>Type</em>}' attribute.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #getType()
   * @generated
   * @ordered
   */
  protected static final BasicType TYPE_EDEFAULT = BasicType.INT;

  /**
   * The cached value of the '{@link #getType() <em>Type</em>}' attribute.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #getType()
   * @generated
   * @ordered
   */
  protected BasicType type = TYPE_EDEFAULT;

  /**
   * The cached value of the '{@link #getVariables() <em>Variables</em>}' containment reference list.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #getVariables()
   * @generated
   * @ordered
   */
  protected EList<Var> variables;

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  protected VarGroupDeclarationImpl()
  {
    super();
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  protected EClass eStaticClass()
  {
    return NablaPackage.Literals.VAR_GROUP_DECLARATION;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public BasicType getType()
  {
    return type;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public void setType(BasicType newType)
  {
    BasicType oldType = type;
    type = newType == null ? TYPE_EDEFAULT : newType;
    if (eNotificationRequired())
      eNotify(new ENotificationImpl(this, Notification.SET, NablaPackage.VAR_GROUP_DECLARATION__TYPE, oldType, type));
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public EList<Var> getVariables()
  {
    if (variables == null)
    {
      variables = new EObjectContainmentEList<Var>(Var.class, this, NablaPackage.VAR_GROUP_DECLARATION__VARIABLES);
    }
    return variables;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public NotificationChain eInverseRemove(InternalEObject otherEnd, int featureID, NotificationChain msgs)
  {
    switch (featureID)
    {
      case NablaPackage.VAR_GROUP_DECLARATION__VARIABLES:
        return ((InternalEList<?>)getVariables()).basicRemove(otherEnd, msgs);
    }
    return super.eInverseRemove(otherEnd, featureID, msgs);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public Object eGet(int featureID, boolean resolve, boolean coreType)
  {
    switch (featureID)
    {
      case NablaPackage.VAR_GROUP_DECLARATION__TYPE:
        return getType();
      case NablaPackage.VAR_GROUP_DECLARATION__VARIABLES:
        return getVariables();
    }
    return super.eGet(featureID, resolve, coreType);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @SuppressWarnings("unchecked")
  @Override
  public void eSet(int featureID, Object newValue)
  {
    switch (featureID)
    {
      case NablaPackage.VAR_GROUP_DECLARATION__TYPE:
        setType((BasicType)newValue);
        return;
      case NablaPackage.VAR_GROUP_DECLARATION__VARIABLES:
        getVariables().clear();
        getVariables().addAll((Collection<? extends Var>)newValue);
        return;
    }
    super.eSet(featureID, newValue);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public void eUnset(int featureID)
  {
    switch (featureID)
    {
      case NablaPackage.VAR_GROUP_DECLARATION__TYPE:
        setType(TYPE_EDEFAULT);
        return;
      case NablaPackage.VAR_GROUP_DECLARATION__VARIABLES:
        getVariables().clear();
        return;
    }
    super.eUnset(featureID);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public boolean eIsSet(int featureID)
  {
    switch (featureID)
    {
      case NablaPackage.VAR_GROUP_DECLARATION__TYPE:
        return type != TYPE_EDEFAULT;
      case NablaPackage.VAR_GROUP_DECLARATION__VARIABLES:
        return variables != null && !variables.isEmpty();
    }
    return super.eIsSet(featureID);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public String toString()
  {
    if (eIsProxy()) return super.toString();

    StringBuffer result = new StringBuffer(super.toString());
    result.append(" (type: ");
    result.append(type);
    result.append(')');
    return result.toString();
  }

} //VarGroupDeclarationImpl