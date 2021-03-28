# frozen_string_literal: true

require File.expand_path '../test_helper', __dir__

class SAMLTest < RedmineSAML::TestCase
  setup do
    prepare_tests
  end

  context '#enabled?' do
    should 'return enabled? if setting is set' do
      change_saml_settings saml_enabled: 0
      assert_not RedmineSAML.enabled?
    end
  end

  context '#onthefly_creation?' do
    should 'return onthefly_creation false if setting is set and plugin is disabled' do
      change_saml_settings saml_enabled: 0,
                           onthefly_creation: 1
      assert_not RedmineSAML.onthefly_creation?
    end

    should 'return onthefly_creation if setting is set and plugin is enabled' do
      change_saml_settings saml_enabled: 1,
                           onthefly_creation: 1
      assert RedmineSAML.onthefly_creation?
    end
  end

  context '#saml_login_label' do
    should 'return saml_login_label if setting is set' do
      val = '1234'
      change_saml_settings saml_login_label: val
      assert_equal val, RedmineSAML.saml_login_label
    end
  end
end
