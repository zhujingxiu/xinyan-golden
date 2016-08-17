<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
 * site setting
 *
 * @package		CI Setting
 * @author		Eric Barnes <http://ericlbarnes.com>
 * @copyright	Copyright (c) Eric Barnes
 * @since		Version 1.0
 */
// ------------------------------------------------------------------------
/**
 * Settings Library
 *
 * Used to manage site setting
 *
 * @package		CI Setting
 * @subpackage	Libraries
 */
class Setting
{
	/**
	 * Global CI Object
	 */
	private $_ci;
	/**
	 * Settings array used to pass settings to template
	 *
	 * @access 	private
	 * @var 	array
	 */
	private $settings = array();
	/**
	 * Settings group array
	 *
	 * @access 	private
	 * @var 	array
	 */
	private $settings_group = array();
	// ------------------------------------------------------------------------
	/**
	 * Constructor assign CI instance
	 *
	 * @return 	void
	 */
	
	private $setting_table = 'setting';
	public function __construct()
	{
		$this->_ci =& get_instance();
		self::get_settings();
	}
	// ------------------------------------------------------------------------
	/**
	 * Get Settings
	 *
	 * Get all the auto loaded settings from the db.
	 *
	 * @return	array
	 */
	public function get_settings()
	{
		// If the array is not empty we already have them.
		if ( ! empty ($this->settings))
		{
			return $this->settings;
		}
		if ( ! $this->_ci->db->table_exists($this->setting_table))
		{
			return FALSE;
		}
		$query = $this->_ci->db->select('code,value,serialized')->where('initial', '1')->get($this->setting_table);

		if ($query->num_rows() == 0)
		{
			return FALSE;
		}
		foreach ($query->result() as $k => $row)
		{
			$_val = maybe_unserialize($row->value);
			$this->settings[$row->code] = $_val;
			$this->_ci->config->set_item($row->code, $_val);
		}
		return $this->settings;
	}
	// ------------------------------------------------------------------------
	/**
	 * Get Setting (Notice Singular)
	 *
	 * Used to pull out one specific setting from the settings table.
	 *
	 * Here is an example:
	 * <code>
	 * <?php
	 * $this->settings->get_setting('site_name');
	 * ?>
	 * </code>
	 *
	 * @access	public
	 * @param	string
	 * @return	mixed
	 */
	public function get_setting($code)
	{
		if ( ! $code)
		{
			return FALSE;
		}
		// First check the auto loaded settings
		if (isset($this->settings[$code]))
		{
			return $this->settings[$code];
		}
		// Now lets try the settings table
		$query = $this->_ci->db->select('value')->where('code', $code)->get($this->setting_table);
		
		if ($query->num_rows() > 0)
		{
			$row = $query->row();
			// Add it to the main settings array
			$_val = maybe_unserialize($row->value);
			$this->settings[$code] = $_val;
			return $_val;
		}
		// Still nothing. How about config?
		// This will retun FALSE if not found.
		return $this->_ci->config->item($code);
	}
	// ------------------------------------------------------------------------
	/**
	 * Get Settings By Group
	 *
	 * Get all the settings from one group
	 *
	 * @param	string
	 * @return	object
	 */
	public function get_settings_by_group($group = '')
	{
		if ( ! $group)
		{
			return FALSE;
		}
		$query = $this->_ci->db->select('code,value')->where('group', $group)->get($this->setting_table);
		 
		if ($query->num_rows() == 0)
		{
			return FALSE;
		}
		foreach ($query->result() as $k => $row)
		{

			$_val = maybe_unserialize($row->value);
			$this->settings[$row->code] = $_val;
			$arr[$row->code] = $_val;
		}
		return $arr;
	}
	// ------------------------------------------------------------------------
	/**
	 * Edit Setting
	 *
	 * @param	string $code
	 * @param	string $value
	 * @return	bool
	 */
	public function edit_setting($code, $value)
	{
		$this->_ci->db->where('code', $code);
		$data['value'] = maybe_serialize($value);
		$data['serialized'] = is_serialized($data['value']);
		$this->_ci->db->update($this->setting_table, $data);
		
		return $this->_ci->db->affected_rows();
	}

	// ------------------------------------------------------------------------
	/**
	 * Add Setting
	 *
	 * Add a new setting but first check and make sure it doesn't exist already exit.
	 *
	 * @param	string $code
	 * @param	string $value
	 * @param	string $group
	 * @param	string $initial
	 * @return	bool
	 */
	public function add_setting($code, $value = '', $group = 'config', $initial = '0')
	{
		// Check and make sure it isn't already added.
		$query = $this->_ci->db->select('value')->where('code', $code)->get($this->setting_table);
		if ($query->num_rows() > 0)
		{
			return $this->edit_setting($code, $value);
		}
		// Now insert it
		$data = array(
			'code' => $code,
			'value' => maybe_serialize($value),
			'group' => $group,
			'initial' => $initial
		);
		$data['serialized'] = is_serialized($data['value']);
		$this->_ci->db->insert($this->setting_table, $data);
		
		return $this->_ci->db->affected_rows();
	}
	// ------------------------------------------------------------------------
	/**
	 * Delete Setting
	 *
	 * @param	string $group
	 * @return	bool
	 */
	public function delete_setting($code)
	{
		$this->_ci->db->delete($this->setting_table, array('code' => $code));
		
		return $this->_ci->db->affected_rows();
	}

		// ------------------------------------------------------------------------
	/**
	 * Delete Setting by group
	 *
	 * @param	string $group
	 * @return	bool
	 */
	public function delete_settings_by_group($group)
	{
		$this->_ci->db->delete($this->setting_table, array('group' => $group));
		
		return $this->_ci->db->affected_rows();
	}
}